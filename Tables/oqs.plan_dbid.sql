SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [oqs].[plan_dbid] (
		[plan_handle]     [varbinary](64) NOT NULL,
		[dbid]            [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [oqs].[plan_dbid]
	ADD
	CONSTRAINT [pk_plan_dbid]
	PRIMARY KEY
	CLUSTERED
	([plan_handle], [dbid])
	ON [PRIMARY]
GO
ALTER TABLE [oqs].[plan_dbid] SET (LOCK_ESCALATION = TABLE)
GO
