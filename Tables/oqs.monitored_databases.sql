SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [oqs].[monitored_databases] (
		[database_name]     [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [oqs].[monitored_databases]
	ADD
	CONSTRAINT [pk_monitored_databases]
	PRIMARY KEY
	CLUSTERED
	([database_name])
	ON [PRIMARY]
GO
ALTER TABLE [oqs].[monitored_databases] SET (LOCK_ESCALATION = TABLE)
GO
