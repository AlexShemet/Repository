SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [oqs].[collection_metadata] (
		[command]                    [nvarchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[collection_interval]        [bigint] NOT NULL,
		[oqs_mode]                   [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[oqs_classic_db]             [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[oqs_maximum_size_mb]        [smallint] NOT NULL,
		[collection_active]          [bit] NOT NULL,
		[execution_threshold]        [tinyint] NOT NULL,
		[data_cleanup_active]        [bit] NOT NULL,
		[data_cleanup_threshold]     [tinyint] NOT NULL,
		[data_cleanup_throttle]      [smallint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [oqs].[collection_metadata]
	ADD
	CONSTRAINT [chk_oqs_mode]
	CHECK
	([oqs_mode]=N'centralized' OR [oqs_mode]=N'classic')
GO
ALTER TABLE [oqs].[collection_metadata]
CHECK CONSTRAINT [chk_oqs_mode]
GO
ALTER TABLE [oqs].[collection_metadata]
	ADD
	CONSTRAINT [df_collection_interval]
	DEFAULT ((60)) FOR [collection_interval]
GO
ALTER TABLE [oqs].[collection_metadata]
	ADD
	CONSTRAINT [df_collection_active]
	DEFAULT ((0)) FOR [collection_active]
GO
ALTER TABLE [oqs].[collection_metadata]
	ADD
	CONSTRAINT [df_execution_threshold]
	DEFAULT ((2)) FOR [execution_threshold]
GO
ALTER TABLE [oqs].[collection_metadata]
	ADD
	CONSTRAINT [df_oqs_maximum_size_mb]
	DEFAULT ((100)) FOR [oqs_maximum_size_mb]
GO
ALTER TABLE [oqs].[collection_metadata]
	ADD
	CONSTRAINT [df_cleanup_active]
	DEFAULT ((0)) FOR [data_cleanup_active]
GO
ALTER TABLE [oqs].[collection_metadata]
	ADD
	CONSTRAINT [df_cleanup_threshold]
	DEFAULT ((30)) FOR [data_cleanup_threshold]
GO
ALTER TABLE [oqs].[collection_metadata]
	ADD
	CONSTRAINT [df_cleanup_throttle]
	DEFAULT ((5000)) FOR [data_cleanup_throttle]
GO
EXEC sp_addextendedproperty N'oqs_version', N'2.3.1', 'SCHEMA', N'oqs', 'TABLE', N'collection_metadata', NULL, NULL
GO
ALTER TABLE [oqs].[collection_metadata] SET (LOCK_ESCALATION = TABLE)
GO
