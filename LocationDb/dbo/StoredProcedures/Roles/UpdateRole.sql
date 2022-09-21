CREATE PROCEDURE [dbo].[UpdateRole]
	@Id int,
	@Nom varchar(20)
AS
BEGIN
	UPDATE Roles
	SET Nom = @Nom
	WHERE Id = @Id;
END