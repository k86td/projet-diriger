CREATE PROCEDURE [dbo].[GetUsager]
	@Id int
AS
BEGIN
	SELECT * FROM Usagers WHERE Id = @Id;
END
