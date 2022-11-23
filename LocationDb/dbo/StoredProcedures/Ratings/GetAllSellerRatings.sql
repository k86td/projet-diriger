CREATE PROCEDURE [dbo].[GetAllSellerRatings]
	@IdVendeur int
AS
BEGIN
	SELECT IdVendeur, IdUsager, Rating FROM dbo.Ratings 
	WHERE IdVendeur = @IdVendeur;
END
