SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.Traceable
@P1 INT,
@P2 NVARCHAR(33),
@P3 DATETIME
AS
BEGIN
  INSERT  INTO dbo.Traceable_Log
          ( P1, P2, P3 )
  VALUES  ( @P1, @P2, @P3 );
 EXEC dbo.Traceable_Spyed @P1 = @P1, @P2 = @P2, @P3 = @P3;
END
GO
