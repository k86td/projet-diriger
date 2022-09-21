CREATE PROCEDURE [dbo].[AddUsager]
	@Id int,
	@IdRole int,
	@Nom varchar(50),
	@Prenom varchar(50),
	@Email varchar(50),
	@Telephone varchar(15),
	@Password varchar(100),
	@Adresse varchar(100)


AS
BEGIN
	INSERT INTO Usagers (IdRole, Nom, Prenom, Prenom, Email, Telephone, Adresse)
	VALUES(@IdRole,@Nom,@Prenom,@Email,@Telephone,@Password,@Adresse);
END
