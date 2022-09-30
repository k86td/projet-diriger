CREATE PROCEDURE [dbo].[UpdateRating]
	@idUsager int,
	@idOffre int,
	@rating int
AS
BEGIN
	UPDATE dbo.Ratings
	SET Rating = @rating
	WHERE IdOffre = @idOffre AND IdUsager = @idUsager;
END
