CREATE PROCEDURE [dbo].[DeleteRating]
	@IdUsager int,
	@IdVendeur int
AS
BEGIN
	DELETE FROM dbo.Ratings WHERE IdVendeur = @IdVendeur AND IdUsager = @IdUsager;
END
