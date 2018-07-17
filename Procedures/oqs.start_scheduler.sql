SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

        -- This is a stored procedure to initiate the Service Broker loop, it can be called manually, or added as a
        -- startup procedure to ensure data collection when SQL Server starts up
            CREATE PROCEDURE[oqs].[start_scheduler]
        AS
            BEGIN
        DECLARE @handle uniqueidentifier;
        SELECT @handle = [conversation_handle]
        FROM[sys].[conversation_endpoints]
        WHERE[is_initiator] = 1
        AND[far_service] = 'oqs_service'
        AND[state] <> 'CD';
        IF @@RowCount = 0
        BEGIN
            BEGIN DIALOG CONVERSATION @handle
            FROM SERVICE[oqs_service]
        TO SERVICE 'oqs_service'
        ON CONTRACT[DEFAULT]
        WITH ENCRYPTION = OFF;

        BEGIN CONVERSATION TIMER(@handle ) TIMEOUT = 1;
        END;
        END;
GO
