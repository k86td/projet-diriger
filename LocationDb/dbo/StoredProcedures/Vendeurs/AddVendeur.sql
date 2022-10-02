CREATE PROCEDURE [dbo].[AddVendeur]
	@IdUsager int
AS
BEGIN
	INSERT INTO dbo.Vendeurs (IdUsager) VALUES (@IdUsager);
END
