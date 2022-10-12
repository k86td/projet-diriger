CREATE PROCEDURE [dbo].[AddCategorieOffre]
	@IdType INT,
	@Nom VARCHAR(30),
	@IdCategorieOffre INT OUT
AS
BEGIN
	INSERT INTO dbo.CategoriesOffres (IdType, Nom)
	VALUES (@IdType, @Nom);

	SET @IdCategorieOffre = SCOPE_IDENTITY();
END;