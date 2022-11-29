CREATE PROCEDURE [dbo].[AddRating]
	@idVendeur int,
	@idUsager int,
	@rating  int,
	@conversation nvarchar(max)
AS
BEGIN
	INSERT INTO dbo.Ratings (IdVendeur, IdUsager, Rating ,Conversation) VALUES (@idVendeur,@idUsager,@rating,@conversation); 
END
