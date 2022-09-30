CREATE PROCEDURE [dbo].[AddTypeOffre]
	@Nom varchar(30)
AS
BEGIN
	INSERT INTO dbo.TypesOffres (Nom) VALUES(@Nom);
END
