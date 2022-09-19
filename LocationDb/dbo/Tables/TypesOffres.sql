CREATE TABLE [dbo].[TypesOffres]
(
	Id int IDENTITY(1,1),
	Nom Varchar(30) NOT NULL UNIQUE,
	PRIMARY KEY(Id)
)
