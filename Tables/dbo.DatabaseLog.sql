SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatabaseLog] (
		[DatabaseLogID]     [int] IDENTITY(1, 1) NOT NULL,
		[PostTime]          [datetime] NOT NULL,
		[DatabaseUser]      [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Event]             [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Schema]            [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Object]            [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[TSQL]              [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[XmlEvent]          [xml] NOT NULL,
		[test]              [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DatabaseLog]
	ADD
	CONSTRAINT [PK_DatabaseLog_DatabaseLogID]
	PRIMARY KEY
	NONCLUSTERED
	([DatabaseLogID])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Nonclustered index created by a primary key constraint.', 'SCHEMA', N'dbo', 'TABLE', N'DatabaseLog', 'INDEX', N'PK_DatabaseLog_DatabaseLogID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (nonclustered) constraint', 'SCHEMA', N'dbo', 'TABLE', N'DatabaseLog', 'CONSTRAINT', N'PK_DatabaseLog_DatabaseLogID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Audit table tracking all DDL changes made to the AdventureWorks database. Data is captured by the database trigger ddlDatabaseTriggerLog.', 'SCHEMA', N'dbo', 'TABLE', N'DatabaseLog', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key for DatabaseLog records.', 'SCHEMA', N'dbo', 'TABLE', N'DatabaseLog', 'COLUMN', N'DatabaseLogID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The date and time the DDL change occurred.', 'SCHEMA', N'dbo', 'TABLE', N'DatabaseLog', 'COLUMN', N'PostTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The user who implemented the DDL change.', 'SCHEMA', N'dbo', 'TABLE', N'DatabaseLog', 'COLUMN', N'DatabaseUser'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The type of DDL statement that was executed.', 'SCHEMA', N'dbo', 'TABLE', N'DatabaseLog', 'COLUMN', N'Event'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The schema to which the changed object belongs.', 'SCHEMA', N'dbo', 'TABLE', N'DatabaseLog', 'COLUMN', N'Schema'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The object that was changed by the DDL statment.', 'SCHEMA', N'dbo', 'TABLE', N'DatabaseLog', 'COLUMN', N'Object'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The exact Transact-SQL statement that was executed.', 'SCHEMA', N'dbo', 'TABLE', N'DatabaseLog', 'COLUMN', N'TSQL'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The raw XML data generated by database trigger.', 'SCHEMA', N'dbo', 'TABLE', N'DatabaseLog', 'COLUMN', N'XmlEvent'
GO
ALTER TABLE [dbo].[DatabaseLog] SET (LOCK_ESCALATION = TABLE)
GO
