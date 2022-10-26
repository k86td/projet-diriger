CREATE PROCEDURE [dbo].[CreateVoiture]
	@IdOffre INT,
	@Annee INT,
	@Couleur VARCHAR(30),
	@Marque VARCHAR(30),
	@Modele VARCHAR(30),
	@Odometre INT,
	@TypeVehicule VARCHAR(30),
	@NombrePorte INT,
	@NombreSiege INT,
	@Carburant VARCHAR(30),
	@Traction VARCHAR(50),
	@Description VARCHAR(100),
	@Accidente BIT
AS
BEGIN
	INSERT INTO dbo.Voitures (
		IdOffre, Annee, Couleur, Marque, Modele, Odometre, TypeVehicule,
		NombrePorte, NombreSiege, Carburant, Traction, [Description],
		Accidente)
		VALUES (@IdOffre,@Annee, @Couleur, @Marque, @Modele, @Odometre, 
		@TypeVehicule, @NombrePorte, @NombreSiege, @Carburant, 
		@Traction, @Description, @Accidente);
END;
