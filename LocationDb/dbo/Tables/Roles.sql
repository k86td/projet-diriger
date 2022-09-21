CREATE TABLE [dbo].[Roles]
(
	Id int IDENTITY(1,1),
	[Nom] Varchar(20) NOT NULL UNIQUE,
	PRIMARY KEY (Id)
)
