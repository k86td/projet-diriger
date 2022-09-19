CREATE TABLE [dbo].[Ratings]
(
	Id int IDENTITY(1,1),
	IdOffre int NOT NULL,
	IdUsager int NOT NULL,
	Rating int NOT NULL,
	PRIMARY KEY(Id),
	CONSTRAINT FK_Offres_Rating FOREIGN KEY (IdOffre) REFERENCES Offres(Id),
	CONSTRAINT FK_Usagers_Rating FOREIGN KEY (IdUsager) REFERENCES Usagers(Id),
	CONSTRAINT chk_ratings_rating CHECK(Rating >= 1 and Rating <=5)
)
