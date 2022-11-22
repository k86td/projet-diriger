CREATE PROCEDURE [dbo].[AddOffre]
	@IdVendeur int,
	@Prix float,
	@Coordonner varchar(50),
	@Nom VARCHAR(50), 
	@IdCategorieOffre INT, 
	@IdTypeOffre INT,
	@OffreId INT OUT,
	@DateDebut DATETIME2,
	@DateFin DATETIME2,
	@image VARCHAR(50)
	
AS
BEGIN
	INSERT INTO Offres (IdVendeur, Prix, Coordonner, Nom, IdCategorieOffre, IdTypeOffre, dateDebut, dateFin, [image])
	VALUES (@IdVendeur, @Prix, @Coordonner, @Nom, @IdCategorieOffre, @IdTypeOffre, @DateDebut, @DateFin, @image)

	SET @OffreId = SCOPE_IDENTITY();
END