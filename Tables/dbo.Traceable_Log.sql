SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Traceable_Log] (
		[Id]           [int] IDENTITY(1, 1) NOT NULL,
		[P1]           [int] NULL,
		[P2]           [nvarchar](33) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[P3]           [datetime] NULL,
		[LogDTime]     [datetime2](7) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Traceable_Log]
	ADD
	CONSTRAINT [PK__Traceabl__3214EC077F60ED59]
	PRIMARY KEY
	CLUSTERED
	([Id])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Traceable_Log]
	ADD
	CONSTRAINT [DF__Traceable__LogDT__014935CB]
	DEFAULT (sysdatetime()) FOR [LogDTime]
GO
ALTER TABLE [dbo].[Traceable_Log] SET (LOCK_ESCALATION = TABLE)
GO
