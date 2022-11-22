CREATE TABLE [dbo].[Ratings]
(
	[IdVendeur] int NOT NULL,
	IdUsager int NOT NULL,
	Rating int NOT NULL,

	CONSTRAINT FK_Vendeurs_Rating FOREIGN KEY ([IdVendeur]) REFERENCES Vendeurs(IdUsager) ON DELETE CASCADE,
	CONSTRAINT FK_Usagers_Rating FOREIGN KEY (IdUsager) REFERENCES Usagers(Id) ON DELETE CASCADE,
	CONSTRAINT chk_ratings_rating CHECK(Rating >= 1 and Rating <=5),

	PRIMARY KEY([IdVendeur], IdUsager)
)
