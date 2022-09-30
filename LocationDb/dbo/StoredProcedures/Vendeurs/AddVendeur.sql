CREATE PROCEDURE [dbo].[AddVendeur]
	@IdUsager int,
	@DateAccepter Datetime
AS
BEGIN
	INSERT INTO dbo.Vendeurs (IdUsager, DateAccepter) VALUES (@IdUsager, @DateAccepter);
END
