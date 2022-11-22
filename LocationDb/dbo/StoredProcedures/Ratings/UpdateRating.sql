CREATE PROCEDURE [dbo].[UpdateRating]
	@idUsager int,
	@idVendeur int,
	@rating int
AS
BEGIN
	UPDATE dbo.Ratings
	SET Rating = @rating
	WHERE IdVendeur = @idVendeur AND IdUsager = @idUsager;
END
