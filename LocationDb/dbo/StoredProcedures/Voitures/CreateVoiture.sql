CREATE PROCEDURE [dbo].[CreateVoiture]
	@IdOffre INT,
	@Couleur VARCHAR(30),
	@Marque VARCHAR(30),
	@Modele VARCHAR(30),
	@Odometre INT,
	@TypeVehicule VARCHAR(30),
	@NombrePorte INT,
	@NombreSiege INT,
	@Traction VARCHAR(50),
	@Description VARCHAR(100),
	@Accidente BIT
AS
BEGIN
	INSERT INTO dbo.Voitures (
		IdOffre, Couleur, Marque, Modele, Odometre, TypeVehicule,
		NombrePorte, NombreSiege, Traction, [Description],
		Accidente)
		VALUES (@IdOffre, @Couleur, @Marque, @Modele, @Odometre, 
		@TypeVehicule, @NombrePorte, @NombreSiege, 
		@Traction, @Description, @Accidente);
END;
