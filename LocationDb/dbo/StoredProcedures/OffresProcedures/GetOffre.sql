CREATE PROCEDURE [dbo].[GetOffre]
	@Id int
AS
BEGIN
	SELECT * FROM Offres WHERE Id = @Id;
END