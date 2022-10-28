CREATE PROCEDURE [dbo].[UpdateUsager]
	@Id int,
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
	UPDATE Usagers
	SET	   IdRole = @IdRole,
		   Nom = @Nom,
		   Prenom = @Prenom,
		   Email = @Email,
		   Telephone = @Telephone,
		   [Password] = @Password,
		   Adresse = @Adresse,
		   Age = @Age
	WHERE Id = @Id;
END