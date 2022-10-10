CREATE PROCEDURE [dbo].[AddOffre]
	@IdVendeur int,
	@Prix float,
	@Date DateTime2(7),
	@Coordonner varchar(50),
	@Nom VARCHAR(50), 
	@IdCategorieOffre INT, 
	@IdTypeOffre INT,
	@OffreId INT OUT
AS
BEGIN
	INSERT INTO Offres (IdVendeur, Prix, [Date], Coordonner, Nom, IdCategorieOffre, IdTypeOffre)
	VALUES (@IdVendeur, @Prix, @Date, @Coordonner, @Nom, @IdCategorieOffre, @IdTypeOffre)

	SET @OffreId = SCOPE_IDENTITY();
END