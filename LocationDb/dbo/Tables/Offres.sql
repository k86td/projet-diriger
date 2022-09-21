CREATE TABLE [dbo].[Offres]
(
	Id int IDENTITY(1,1),
	IdVendeur int NOT NULL Unique,
	Prix Money NOT NULL,
	[Date] Datetime2(7) DEFAULT GETDATE() NOT NULL,
	Coordonner Varchar(50) NOT NULL,
	
	PRIMARY KEY(Id),
	CONSTRAINT chk_offres_prix CHECK (Prix > 0),
	CONSTRAINT fk_offres_vendeurs FOREIGN KEY (IdVendeur) REFERENCES Vendeurs(IdUsager)
)
