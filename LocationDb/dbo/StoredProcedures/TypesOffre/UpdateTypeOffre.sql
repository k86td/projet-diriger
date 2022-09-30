CREATE PROCEDURE [dbo].[UpdateTypeOffre]
	@Id int,
	@Nom varchar(30)
AS
BEGIN
	UPDATE TypesOffres
	SET Nom = @Nom
	WHERE Id = @Id;
END
