CREATE PROCEDURE [dbo].[DeleteVendeur]
	@IdUsager int
AS
BEGIN
	DELETE FROM dbo.Vendeurs WHERE IdUsager = @IdUsager;
END
