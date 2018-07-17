SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [oqs].[intervals] (
		[interval_id]        [int] IDENTITY(1, 1) NOT NULL,
		[interval_start]     [datetime] NULL,
		[interval_end]       [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [oqs].[intervals]
	ADD
	CONSTRAINT [pk_intervals]
	PRIMARY KEY
	CLUSTERED
	([interval_id])
	ON [PRIMARY]
GO
ALTER TABLE [oqs].[intervals] SET (LOCK_ESCALATION = TABLE)
GO
