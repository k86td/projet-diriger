CREATE PROCEDURE [dbo].[EditVoiture]
	@IdOffre INT,
	@Annee INT,
	@Couleur VARCHAR(30),
	@Marque VARCHAR(30),
	@Odometre INT,
	@TypeVehicule VARCHAR(30),
	@NombrePorte INT,
	@NombreSiege INT,
	@Traction VARCHAR(50),
	@Description VARCHAR(100),
	@Accidente BIT
AS
BEGIN
	UPDATE dbo.Voitures
	SET 
		Annee = @Annee,
		Couleur = @Couleur,
		Marque = @Marque,
		Odometre = @Odometre,
		TypeVehicule = @TypeVehicule,
		NombrePorte = @NombrePorte,
		NombreSiege = @NombreSiege,
		Traction = @Traction,
		[Description] = @Description,
		Accidente = @Accidente
	WHERE IdOffre = @IdOffre
END;
