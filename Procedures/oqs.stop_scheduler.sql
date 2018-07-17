SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- This is a stored procedure to(temporarilly) stop OQS data collection
        CREATE PROCEDURE[oqs].[stop_scheduler]
        AS
            BEGIN
        DECLARE @handle uniqueidentifier;
        SELECT @handle = [conversation_handle]
        FROM[sys].[conversation_endpoints]
        WHERE[is_initiator] = 1
        AND[far_service] = 'oqs_service'
        AND[state] <> 'CD';
        IF @@RowCount<> 0 END CONVERSATION @handle;
        END;
GO
