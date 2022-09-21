CREATE PROCEDURE [dbo].[DeleteOffre]
	@Id int
AS
BEGIN
	DELETE FROM Offres WHERE Id = @Id;
END