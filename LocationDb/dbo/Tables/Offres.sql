CREATE TABLE [dbo].[Offres]
(
	Id int IDENTITY(1,1),
	IdVendeur int NOT NULL Unique,
	Prix Money NOT NULL,
	[Date] Datetime2(7) DEFAULT CURRENT_TIMESTAMP,
	Coordonner Varchar(50) NOT NULL,
	PRIMARY KEY(Id),
	CONSTRAINT chk_offres_prix CHECK (Prix > 0)
)
