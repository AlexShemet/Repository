SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [oqs].[wait_type_filter] (
		[wait_type]       [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[oqs_default]     [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [oqs].[wait_type_filter]
	ADD
	CONSTRAINT [pk_wait_type_filter]
	PRIMARY KEY
	CLUSTERED
	([wait_type])
	ON [PRIMARY]
GO
ALTER TABLE [oqs].[wait_type_filter]
	ADD
	CONSTRAINT [df_wait_type_filter_oqs_default]
	DEFAULT ((0)) FOR [oqs_default]
GO
ALTER TABLE [oqs].[wait_type_filter] SET (LOCK_ESCALATION = TABLE)
GO
