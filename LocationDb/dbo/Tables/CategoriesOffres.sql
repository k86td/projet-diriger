﻿CREATE TABLE [dbo].[CategoriesOffres]
(
	Id int IDENTITY(1,1),
	IdType int NOT NULL,
	Nom Varchar(30) NOT NULL UNIQUE,
	PRIMARY KEY(Id),
	CONSTRAINT FK_TypesOffres FOREIGN KEY (IdType) REFERENCES TypesOffres(Id)
)
