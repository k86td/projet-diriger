CREATE PROCEDURE [dbo].[DeleteTypeOffre]
	@Id int
AS
BEGIN
	DELETE FROM dbo.TypesOffres WHERE id = @Id;
END
