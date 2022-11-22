CREATE PROCEDURE [dbo].[AddRating]
	@idOffre int,
	@idUsager int,
	@rating  int
AS
BEGIN
	INSERT INTO dbo.Ratings (IdVendeur, IdUsager, Rating) VALUES (@idOffre,@idUsager,@rating); 
END
