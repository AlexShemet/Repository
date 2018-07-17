SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [oqs].[wait_stats] (
		[interval_id]             [int] NOT NULL,
		[wait_type]               [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[waiting_tasks_count]     [bigint] NOT NULL,
		[wait_time_ms]            [bigint] NOT NULL,
		[max_wait_time_ms]        [bigint] NOT NULL,
		[signal_wait_time_ms]     [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [oqs].[wait_stats]
	ADD
	CONSTRAINT [pk_wait_stats]
	PRIMARY KEY
	CLUSTERED
	([interval_id], [wait_type])
	ON [PRIMARY]
GO
ALTER TABLE [oqs].[wait_stats] SET (LOCK_ESCALATION = TABLE)
GO
