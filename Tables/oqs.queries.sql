SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [oqs].[queries] (
		[query_id]                         [int] IDENTITY(1, 1) NOT NULL,
		[plan_id]                          [int] NOT NULL,
		[query_hash]                       [binary](8) NULL,
		[query_plan_MD5]                   [varbinary](72) NULL,
		[query_statement_text]             [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[query_statement_start_offset]     [int] NULL,
		[query_statement_end_offset]       [int] NULL,
		[query_creation_time]              [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [oqs].[queries]
	ADD
	CONSTRAINT [pk_queries]
	PRIMARY KEY
	CLUSTERED
	([query_id])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [uncl_queries_cleanup]
	ON [oqs].[queries] ([query_id], [plan_id])
	ON [PRIMARY]
GO
ALTER TABLE [oqs].[queries] SET (LOCK_ESCALATION = TABLE)
GO
