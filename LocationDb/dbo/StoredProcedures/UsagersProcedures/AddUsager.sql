CREATE PROCEDURE [dbo].[AddUsager]
	@IdRole int,
	@Nom varchar(50),
	@Prenom varchar(50),
	@Email varchar(50),
	@Telephone varchar(15),
	@Password varchar(100),
	@Adresse varchar(100),
	@Age int
AS
BEGIN
	INSERT INTO Usagers (IdRole, Nom, Prenom, Email, Telephone, [Password], Adresse, Age)
	VALUES				(@IdRole,@Nom,@Prenom,@Email,@Telephone,@Password,@Adresse, @Age)
END
