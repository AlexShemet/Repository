SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [oqs].[data_cleanup]
    @data_cleanup_threshold smallint,
    @data_cleanup_throttle  smallint
AS
    BEGIN

        SELECT @data_cleanup_threshold = [CM].[data_cleanup_threshold],
               @data_cleanup_throttle  = [CM].[data_cleanup_throttle]
        FROM   [oqs].[collection_metadata] AS [CM];

        DELETE TOP ( @data_cleanup_throttle )
        FROM [oqs].[activity_log]
        WHERE [log_timestamp] < DATEADD( DAY, -@data_cleanup_threshold, GETDATE());

        -- We're going to collect query_ids to allow for a controlled deletion in this purge step
        -- There are multiple tables to be cleaned up, so we store the deletion candidates in a temp table

        IF OBJECT_ID( 'tempdb..#query_id_deletion_candidates' ) IS NOT NULL
            DROP TABLE [#query_id_deletion_candidates];

        CREATE TABLE [#query_id_deletion_candidates]
            (
                [query_id] int NOT NULL,
                [plan_id]  int NOT NULL,
                PRIMARY KEY CLUSTERED ( [query_id], [plan_id] )
            );

        WITH [deletion_candidates] ( [query_id], [last_execution_date] )
        AS ( SELECT   [QRS].[query_id],
                      MAX( [QRS].[last_execution_time] ) AS [last_execution_time]
             FROM     [oqs].[query_runtime_stats] AS [QRS]
             GROUP BY [QRS].[query_id]
           )
        INSERT INTO [#query_id_deletion_candidates] (   [query_id],
                                                        [plan_id]
                                                    )
                    SELECT [Q].[query_id],
                           [Q].[plan_id]
                    FROM   [deletion_candidates]      AS [DC]
                           INNER JOIN [oqs].[queries] AS [Q] ON [Q].[query_id] = [DC].[query_id]
                    WHERE  [DC].[last_execution_date] < DATEADD( DAY, -@data_cleanup_threshold, GETDATE());
        ;


        DELETE TOP ( @data_cleanup_throttle )
        [QRS]
        FROM [#query_id_deletion_candidates]        AS [QIDC]
             INNER JOIN [oqs].[query_runtime_stats] AS [QRS] ON [QRS].[query_id] = [QIDC].[query_id];

        DELETE TOP ( @data_cleanup_throttle )
        [Q]
        FROM [#query_id_deletion_candidates] AS [QIDC]
             INNER JOIN [oqs].[queries]      AS [Q] ON [Q].[plan_id] = [QIDC].[plan_id]
                                                       AND [Q].[query_id] = [QIDC].[query_id];

        DELETE TOP ( @data_cleanup_throttle )
        [P]
        FROM  [#query_id_deletion_candidates] AS [QIDC]
              INNER JOIN [oqs].[plans]        AS [P] ON [P].[plan_id] = [QIDC].[plan_id]
        WHERE NOT EXISTS ( SELECT * FROM [oqs].[queries] AS [Q] WHERE [P].[plan_id] = [Q].[plan_id] );

        DECLARE @interval_id int;

        -- For wait_stats we identify deletion candidates by getting the youngest interval within the deletion threshold
        SELECT @interval_id = MAX( [I].[interval_id] )
        FROM   [oqs].[intervals] AS [I]
        WHERE  [I].[interval_end] < DATEADD( DAY, -@data_cleanup_threshold, GETDATE());

        DELETE TOP ( @data_cleanup_throttle )
        FROM [oqs].[wait_stats]
        WHERE [interval_id] <= @interval_id;


    END;
GO
