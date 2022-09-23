CREATE PROCEDURE [dbo].[DeleteUser]
	@Id int
AS
BEGIN
	DELETE FROM Usagers WHERE Id = @Id;
END
