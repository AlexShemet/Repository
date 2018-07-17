SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [oqs].[plans] (
		[plan_id]                [int] IDENTITY(1, 1) NOT NULL,
		[plan_MD5]               [varbinary](32) NOT NULL,
		[plan_handle]            [varbinary](64) NULL,
		[plan_firstfound]        [datetime] NULL,
		[plan_database]          [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[plan_refcounts]         [int] NULL,
		[plan_usecounts]         [int] NULL,
		[plan_sizeinbytes]       [int] NULL,
		[plan_type]              [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[plan_objecttype]        [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[plan_executionplan]     [xml] NULL,
		[plan_optimization]      [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[xml_processed]          [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [oqs].[plans]
	ADD
	CONSTRAINT [pk_plans]
	PRIMARY KEY
	CLUSTERED
	([plan_id])
	ON [PRIMARY]
GO
ALTER TABLE [oqs].[plans]
	ADD
	CONSTRAINT [DF_plans_xml_processed]
	DEFAULT ((0)) FOR [xml_processed]
GO
ALTER TABLE [oqs].[plans] SET (LOCK_ESCALATION = TABLE)
GO
