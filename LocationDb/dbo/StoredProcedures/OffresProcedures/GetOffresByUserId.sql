CREATE PROCEDURE [dbo].[GetOffresBySellerId]
	@Id int
AS
BEGIN
	SELECT * FROM dbo.Offres WHERE IdVendeur = @Id;
END
