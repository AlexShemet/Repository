SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- Create the OQS Purge OQS Stored Procedure
CREATE PROCEDURE [oqs].[purge_oqs]
AS
BEGIN
    
    SET NOCOUNT ON

    TRUNCATE TABLE [oqs].[activity_log];
    TRUNCATE TABLE [oqs].[intervals];
    TRUNCATE TABLE [oqs].[plan_dbid];
    TRUNCATE TABLE [oqs].[plans];
    TRUNCATE TABLE [oqs].[queries];
    TRUNCATE TABLE [oqs].[query_runtime_stats];
    TRUNCATE TABLE [oqs].[wait_stats];
    TRUNCATE TABLE [oqs].[excluded_queries];
END
GO
