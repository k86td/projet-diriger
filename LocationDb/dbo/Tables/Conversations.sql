CREATE TABLE [dbo].[Conversations]
(
	Id INT IDENTITY(1,1),
	IdAuteur int NOT NULL,
	IdDestinataire int NOT NULL,
	Contenu Varchar(100) NOT NULL,
	[Date] Datetime2(7) DEFAULT GETDATE(),

	PRIMARY KEY(Id),
	
	CONSTRAINT FK_Usagers_Auteur FOREIGN KEY (IdAuteur) REFERENCES Usagers(Id),
	CONSTRAINT FK_Usagers_Destinataires FOREIGN KEY (IdDestinataire) REFERENCES Usagers(Id)
)
