CREATE TABLE [dbo].[Conversations]
(
	 IdAuteur int IDENTITY(1,1),
	 IdDestinataire int NOT NULL,
	 Contenu Varchar(100) NOT NULL UNIQUE,
	 [Date] Datetime2(7) DEFAULT CURRENT_TIMESTAMP,
	 PRIMARY KEY(IdAuteur, IdDestinataire),
	 CONSTRAINT FK_Usagers FOREIGN KEY (IdAuteur) REFERENCES Usagers(Id),
	 CONSTRAINT FK_Usagers_Destinataires FOREIGN KEY (IdDestinataire) REFERENCES Usagers(Id)
)
