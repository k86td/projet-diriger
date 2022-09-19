CREATE TABLE [dbo].[DemandesOffres]
(
	Id int IDENTITY(1,1),
	IdOffre int NOT NULL,
	IdUsager int NOT NULL,
	[Date] Datetime2(7) DEFAULT CURRENT_TIMESTAMP,
	Accepter Bit DEFAULT 0,
	PRIMARY KEY (Id),
	CONSTRAINT FK_Offres_Demande FOREIGN KEY (IdOffre) REFERENCES Offres(Id),
	CONSTRAINT FK_Usagers_Demande FOREIGN KEY (IdUsager) REFERENCES Usagers(Id)
)
