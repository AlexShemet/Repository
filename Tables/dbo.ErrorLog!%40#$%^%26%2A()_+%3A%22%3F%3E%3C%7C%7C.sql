SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorLog!@#$%^&*()_+:"?><||] (
		[ErrorLogID]         [int] IDENTITY(1, 1) NOT NULL,
		[ErrorTime]          [datetime] NOT NULL,
		[UserName]           [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ErrorNumber]        [int] NOT NULL,
		[ErrorSeverity]      [int] NULL,
		[ErrorState]         [int] NULL,
		[ErrorProcedure]     [nvarchar](126) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ErrorLine]          [int] NULL,
		[ErrorMessage]       [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[test]               [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ErrorLog!@#$%^&*()_+:"?><||]
	ADD
	CONSTRAINT [PK_ErrorLog_ErrorLogID]
	PRIMARY KEY
	CLUSTERED
	([ErrorLogID])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog!@#$%^&*()_+:"?><||', 'INDEX', N'PK_ErrorLog_ErrorLogID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog!@#$%^&*()_+:"?><||', 'CONSTRAINT', N'PK_ErrorLog_ErrorLogID'
GO
ALTER TABLE [dbo].[ErrorLog!@#$%^&*()_+:"?><||]
	ADD
	CONSTRAINT [DF_ErrorLog_ErrorTime]
	DEFAULT (getdate()) FOR [ErrorTime]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog!@#$%^&*()_+:"?><||', 'CONSTRAINT', N'DF_ErrorLog_ErrorTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Audit table tracking errors in the the AdventureWorks database that are caught by the CATCH block of a TRY...CATCH construct. Data is inserted by stored procedure dbo.uspLogError when it is executed from inside the CATCH block of a TRY...CATCH construct.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog!@#$%^&*()_+:"?><||', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key for ErrorLog records.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog!@#$%^&*()_+:"?><||', 'COLUMN', N'ErrorLogID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The date and time at which the error occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog!@#$%^&*()_+:"?><||', 'COLUMN', N'ErrorTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The user who executed the batch in which the error occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog!@#$%^&*()_+:"?><||', 'COLUMN', N'UserName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The error number of the error that occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog!@#$%^&*()_+:"?><||', 'COLUMN', N'ErrorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The severity of the error that occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog!@#$%^&*()_+:"?><||', 'COLUMN', N'ErrorSeverity'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The state number of the error that occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog!@#$%^&*()_+:"?><||', 'COLUMN', N'ErrorState'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the stored procedure or trigger where the error occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog!@#$%^&*()_+:"?><||', 'COLUMN', N'ErrorProcedure'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The line number at which the error occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog!@#$%^&*()_+:"?><||', 'COLUMN', N'ErrorLine'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The message text of the error that occurred.', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog!@#$%^&*()_+:"?><||', 'COLUMN', N'ErrorMessage'
GO
ALTER TABLE [dbo].[ErrorLog!@#$%^&*()_+:"?><||] SET (LOCK_ESCALATION = TABLE)
GO
