CREATE PROCEDURE [dbo].[AddOffre]
	@IdVendeur int,
	@Prix float,
	@Coordonner varchar(50),
	@Nom VARCHAR(50), 
	@IdCategorieOffre INT, 
	@IdTypeOffre INT,
	@OffreId INT OUT,
	@DateDebut DATETIME2,
	@DateFin DATETIME2
	
AS
BEGIN
	INSERT INTO Offres (IdVendeur, Prix, Coordonner, Nom, IdCategorieOffre, IdTypeOffre, dateDebut, dateFin)
	VALUES (@IdVendeur, @Prix, @Coordonner, @Nom, @IdCategorieOffre, @IdTypeOffre, @DateDebut, @DateFin)

	SET @OffreId = SCOPE_IDENTITY();
END