SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [oqs].[activity_log] (
		[log_id]            [int] IDENTITY(1, 1) NOT NULL,
		[log_run_id]        [int] NULL,
		[log_timestamp]     [datetime] NULL,
		[log_message]       [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [oqs].[activity_log]
	ADD
	CONSTRAINT [pk_log_id]
	PRIMARY KEY
	CLUSTERED
	([log_id])
	ON [PRIMARY]
GO
ALTER TABLE [oqs].[activity_log] SET (LOCK_ESCALATION = TABLE)
GO
