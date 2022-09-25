CREATE PROCEDURE [dbo].[DeleteRating]
	@IdUsager int,
	@IdOffre int
AS
BEGIN
	DELETE FROM dbo.Ratings WHERE IdOffre = @IdOffre AND IdUsager = @IdUsager;
END
