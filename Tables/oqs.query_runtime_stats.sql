SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [oqs].[query_runtime_stats] (
		[query_id]                 [int] NOT NULL,
		[interval_id]              [int] NOT NULL,
		[creation_time]            [datetime] NOT NULL,
		[last_execution_time]      [datetime] NOT NULL,
		[execution_count]          [bigint] NOT NULL,
		[total_elapsed_time]       [bigint] NOT NULL,
		[last_elapsed_time]        [bigint] NOT NULL,
		[min_elapsed_time]         [bigint] NOT NULL,
		[max_elapsed_time]         [bigint] NOT NULL,
		[avg_elapsed_time]         [bigint] NOT NULL,
		[total_rows]               [bigint] NOT NULL,
		[last_rows]                [bigint] NOT NULL,
		[min_rows]                 [bigint] NOT NULL,
		[max_rows]                 [bigint] NOT NULL,
		[avg_rows]                 [bigint] NOT NULL,
		[total_worker_time]        [bigint] NOT NULL,
		[last_worker_time]         [bigint] NOT NULL,
		[min_worker_time]          [bigint] NOT NULL,
		[max_worker_time]          [bigint] NOT NULL,
		[avg_worker_time]          [bigint] NOT NULL,
		[total_physical_reads]     [bigint] NOT NULL,
		[last_physical_reads]      [bigint] NOT NULL,
		[min_physical_reads]       [bigint] NOT NULL,
		[max_physical_reads]       [bigint] NOT NULL,
		[avg_physical_reads]       [bigint] NOT NULL,
		[total_logical_reads]      [bigint] NOT NULL,
		[last_logical_reads]       [bigint] NOT NULL,
		[min_logical_reads]        [bigint] NOT NULL,
		[max_logical_reads]        [bigint] NOT NULL,
		[avg_logical_reads]        [bigint] NOT NULL,
		[total_logical_writes]     [bigint] NOT NULL,
		[last_logical_writes]      [bigint] NOT NULL,
		[min_logical_writes]       [bigint] NOT NULL,
		[max_logical_writes]       [bigint] NOT NULL,
		[avg_logical_writes]       [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [oqs].[query_runtime_stats]
	ADD
	CONSTRAINT [pk_query_runtime_stats]
	PRIMARY KEY
	CLUSTERED
	([query_id], [interval_id])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [uncl_query_runtime_stats_cleanup]
	ON [oqs].[query_runtime_stats] ([query_id], [interval_id])
	INCLUDE ([last_execution_time])
	ON [PRIMARY]
GO
ALTER TABLE [oqs].[query_runtime_stats] SET (LOCK_ESCALATION = TABLE)
GO
