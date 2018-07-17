SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [oqs].[excluded_queries] (
		[query_id]     [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [oqs].[excluded_queries]
	ADD
	CONSTRAINT [pk_excluded_queries_query_id]
	PRIMARY KEY
	CLUSTERED
	([query_id])
	ON [PRIMARY]
GO
ALTER TABLE [oqs].[excluded_queries] SET (LOCK_ESCALATION = TABLE)
GO
