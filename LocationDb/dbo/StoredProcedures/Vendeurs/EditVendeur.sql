CREATE PROCEDURE [dbo].[EditVendeur]
	@IdUsager int,
	@DateAccepter Datetime
AS
BEGIN
	UPDATE dbo.Vendeurs 
	SET DateAccepter = @DateAccepter
	WHERE IdUsager =  @IdUsager
END
