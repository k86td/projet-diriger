CREATE PROCEDURE [dbo].[DeleteRole]
	@Id int
AS
BEGIN
	DELETE FROM Roles WHERE Id = @Id;
END