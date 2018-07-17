SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [oqs].[query_stats]
        AS
            SELECT[sql_handle],
        [statement_start_offset],
        [statement_end_offset],
        [plan_generation_num],
        [plan_handle],
        [creation_time],
        [last_execution_time],
        [execution_count],
        [total_worker_time],
        [last_worker_time],
        [min_worker_time],
        [max_worker_time],
        [total_physical_reads],
        [last_physical_reads],
        [min_physical_reads],
        [max_physical_reads],
        [total_logical_writes],
        [last_logical_writes],
        [min_logical_writes],
        [max_logical_writes],
        [total_logical_reads],
        [last_logical_reads],
        [min_logical_reads],
        [max_logical_reads],
        [total_clr_time],
        [last_clr_time],
        [min_clr_time],
        [max_clr_time],
        [total_elapsed_time],
        [last_elapsed_time],
        [min_elapsed_time],
        [max_elapsed_time],[query_hash],[query_plan_hash],CAST(0 as bigint) [total_rows],CAST(0 as bigint) [last_rows],CAST(0 as bigint) [min_rows],CAST(0 as bigint) [max_rows],CAST(NULL as varbinary (64)) [statement_sql_handle],CAST(NULL as bigint) [statement_context_id],CAST(0 as bigint) [total_dop],CAST(0 as bigint) [last_dop],CAST(0 as bigint) [min_dop],CAST(0 as bigint) [max_dop],CAST(0 as bigint) [total_grant_kb],CAST(0 as bigint) [last_grant_kb],CAST(0 as bigint) [min_grant_kb],CAST(0 as bigint) [max_grant_kb],CAST(0 as bigint) [total_used_grant_kb],CAST(0 as bigint) [last_used_grant_kb],CAST(0 as bigint) [min_used_grant_kb],CAST(0 as bigint) [max_used_grant_kb],CAST(0 as bigint) [total_ideal_grant_kb],CAST(0 as bigint) [last_ideal_grant_kb],CAST(0 as bigint) [min_ideal_grant_kb],CAST(0 as bigint) [max_ideal_grant_kb],CAST(0 as bigint) [total_reserved_threads],CAST(0 as bigint) [last_reserved_threads],CAST(0 as bigint) [min_reserved_threads],CAST(0 as bigint) [max_reserved_threads],CAST(0 as bigint) [total_used_threads],CAST(0 as bigint) [last_used_threads],CAST(0 as bigint) [min_used_threads],CAST(0 as bigint) [max_used_threads] FROM [sys].[dm_exec_query_stats];
GO
