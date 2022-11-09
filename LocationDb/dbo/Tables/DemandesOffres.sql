CREATE TABLE [dbo].[DemandesOffres]
(
	IdOffre int NOT NULL,
	IdUsager int NOT NULL,
	[Date] Datetime2(7) DEFAULT GETDATE(),
	Accepter Bit DEFAULT 0,

	[Payer] BIT NULL DEFAULT 0, 
    PRIMARY KEY (IdOffre, IdUsager),
	
	CONSTRAINT FK_Offres_Demande FOREIGN KEY (IdOffre) REFERENCES Offres(Id) ON DELETE CASCADE,
	CONSTRAINT FK_Usagers_Demande FOREIGN KEY (IdUsager) REFERENCES Usagers(Id) ON DELETE CASCADE
)
