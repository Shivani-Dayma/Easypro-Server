IF OBJECT_ID('testDecimal') IS NOT NULL DROP PROC testDecimal
go
CREATE PROCEDURE testDecimal
  @idecimal NUMERIC(20,10)
AS
BEGIN
	SELECT CAST(246 AS INTEGER)
END
go
IF OBJECT_ID('testDecimal') IS NOT NULL DROP PROC testDecimal
go

