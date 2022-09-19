CREATE TABLE [dbo].[Roles]
(
	Id int IDENTITY(1,1),
	[Nom] Varchar(20) NOT NULL Unique,
	PRIMARY KEY (Id)
)
