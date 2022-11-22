CREATE PROCEDURE [dbo].[GetAllSellerRatings]
	@IdVendeur int
AS
BEGIN
	SELECT Rating,Nom,Prenom FROM dbo.Ratings INNER JOIN dbo.Usagers ON Ratings.IdUsager = Usagers.Id 
	WHERE IdVendeur = @IdVendeur;
END
