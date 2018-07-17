SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE oqs.exclude_query_from_dashboard @query_id int
AS
BEGIN
    INSERT INTO [oqs].[excluded_queries] ( [query_id] )
    VALUES ( @query_id )
END
GO
