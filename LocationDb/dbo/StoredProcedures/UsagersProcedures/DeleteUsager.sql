CREATE PROCEDURE [dbo].[DeleteUSer]
	@Id int
AS
	DELETE FROM Usagers WHERE Id = @Id;
RETURN 0
