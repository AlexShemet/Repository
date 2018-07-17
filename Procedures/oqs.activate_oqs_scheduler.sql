SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- This is the stored procedure run by Service Broker to perform the looped execution of data collection
CREATE PROCEDURE [oqs].[activate_oqs_scheduler]
WITH EXECUTE AS OWNER
AS
    BEGIN
        DECLARE @Handle uniqueidentifier,
                @Type   sysname,
                @msg    nvarchar (MAX);
        WAITFOR (   RECEIVE TOP ( 1 ) @Handle = [conversation_handle],
                                      @Type = [message_type_name]
                        FROM [oqs].[oqs_scheduler]
                ),
        TIMEOUT 5000;
        IF @Handle IS NULL RETURN;
        IF @Type = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' -- This is the timer loop for normal operation
        BEGIN
        -- Grab the OQS configuration
        DECLARE @Command            nvarchar(2000),
        @CollectionInterval bigint,
            @OQSMode            nvarchar(20),
        @OQSClassicDB nvarchar(128);

        SELECT @Command = [CM].[command],
        @CollectionInterval = [CM].[collection_interval],
        @OQSMode = [CM].[oqs_mode],
        @OQSClassicDB = [CM].[oqs_classic_db]
        FROM[oqs].[collection_metadata] AS[CM];

        -- Classic mode only monitors one database(stored in the collection_metadata table)
            -- We need to remove all other entries in monitored_databases to keep the dashboard clean
        -- This trick keeps the codebase for both classic and centralized mode cleaner
        IF @OQSMode = N'classic'
        BEGIN
            TRUNCATE TABLE[oqs].[monitored_databases];
        INSERT INTO[oqs].[monitored_databases]
        ( [database_name] )
        VALUES(@OQSClassicDB );
        END;

        -- Place the OQS collection command into a delayed execution queue in service broker
        BEGIN CONVERSATION TIMER(@Handle ) TIMEOUT = @CollectionInterval;
        EXEC(@Command );

        END;
        ELSE END CONVERSATION @Handle;
        END;

-- Add the stored procedure to the queue so it gets activated
            ALTER QUEUE[oqs].[oqs_scheduler]
        WITH STATUS = ON,
            RETENTION = OFF,
            ACTIVATION (   STATUS = ON,
        PROCEDURE_NAME = [oqs].[activate_oqs_scheduler],
        MAX_QUEUE_READERS = 1,
        EXECUTE AS OWNER
        ); 
GO
