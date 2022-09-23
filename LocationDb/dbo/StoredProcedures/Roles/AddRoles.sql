CREATE PROCEDURE [dbo].[AddRoles]
	@Nom varchar(20)
AS
BEGIN
	INSERT INTO Roles (Nom) VALUES (@Nom);
END