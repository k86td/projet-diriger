CREATE TABLE [dbo].[Offres]
(
	Id int IDENTITY(1,1),
	Nom VARCHAR(25),
	IdVendeur int NOT NULL,
	Prix Money NOT NULL,
	Coordonner Varchar(50) NOT NULL,
	IdCategorieOffre INT,
	IdTypeOffre INT,
	[dateDebut] DATETIME2 NOT NULL, 
    [dateFin] DATETIME2 NOT NULL, 
    PRIMARY KEY(Id),
	CONSTRAINT fk_offres_typeOffre FOREIGN KEY (IdTypeOffre) REFERENCES TypesOffres(Id),
	CONSTRAINT fk_offres_categorieOffre FOREIGN KEY (IdCategorieOffre) REFERENCES CategoriesOffres(Id),
	CONSTRAINT chk_offres_prix CHECK (Prix > 0),
	CONSTRAINT fk_offres_vendeurs FOREIGN KEY (IdVendeur) REFERENCES Vendeurs(IdUsager)
)
