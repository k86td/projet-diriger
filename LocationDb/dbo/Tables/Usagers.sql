CREATE TABLE [dbo].[Usagers]
(
	Id int IDENTITY(1,1),
	IdRole int NOT NULL,
	Nom varchar(50) NOT NULL,
	Prenom varchar(50) NOT NULL,
	Email varchar(50) NOT NULL UNIQUE,
	Telephone varchar(15) NOT NULL,
	[Password] Varchar(100) NOT NULL,
	Adresse Varchar(100) NOT NULL,
	[Age] INT NULL, 
	ImageProfil varchar(MAX) NULL
    PRIMARY KEY (Id)
)
