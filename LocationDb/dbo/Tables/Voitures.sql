CREATE TABLE [dbo].[Voitures]
(
	[IdOffre] INT NOT NULL PRIMARY KEY,
	Annee INT NOT NULL,
	Couleur VARCHAR(30) NOT NULL,
	Marque VARCHAR(30) NOT NULL,
	Modele VARCHAR(30) NOT NULL,
	Odometre INT NOT NULL,
	TypeVehicule VARCHAR(30) NOT NULL,
	NombrePorte INT NOT NULL,
	NombreSiege INT NOT NULL,
	Carburant VARCHAR(30) NOT NULL,
	Traction VARCHAR(50) NOT NULL,
	[Description] VARCHAR(100) NOT NULL,
	Accidente BIT NOT NULL,

	CONSTRAINT fk_voitures_offres FOREIGN KEY (IdOffre) REFERENCES Offres(Id)
)
