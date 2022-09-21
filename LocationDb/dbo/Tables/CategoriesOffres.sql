CREATE TABLE [dbo].[CategoriesOffres]
(
	IdType int NOT NULL,
	Nom Varchar(30) NOT NULL UNIQUE,
	
	PRIMARY KEY(IdType),

	CONSTRAINT FK_TypesOffres FOREIGN KEY (IdType) REFERENCES TypesOffres(Id) ON DELETE CASCADE
)
