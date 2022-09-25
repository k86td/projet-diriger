CREATE PROCEDURE [dbo].[GetAllOfferRatings]
	@IdOffre int
AS
BEGIN
	SELECT Rating,Nom,Prenom FROM dbo.Ratings INNER JOIN dbo.Usagers ON Ratings.IdUsager = Usagers.Id 
	WHERE IdOffre = @IdOffre;
END
