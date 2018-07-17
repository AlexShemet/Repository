SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW oqs.object_catalog
AS
SELECT o.[name] AS [object_name],
       o.[object_id] AS [object_id],
       o.[type] AS [object_type],
	   ps.row_count,
	   ( ps.reserved_page_count * 8 ) AS [space_used_kb]
FROM sys.objects o
    INNER JOIN sys.schemas s
        ON o.[schema_id] = s.[schema_id]
	LEFT JOIN sys.dm_db_partition_stats ps ON ps.object_id = o.object_id AND ps.index_id IN (0,1)
WHERE s.[name] = 'oqs';
GO
