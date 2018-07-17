CREATE SERVICE [oqs_service]
	AUTHORIZATION [dbo]
	ON QUEUE [oqs].[oqs_scheduler]
	([DEFAULT])
GO
