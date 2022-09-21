CREATE TABLE [dbo].[Vendeurs]
(
	[IdUsager] INT NOT NULL PRIMARY KEY,
	DateAccepter DATETIME2(7) DEFAULT GETDATE() NOT NULL,

	CONSTRAINT fk_vendeurs_usagers FOREIGN KEY (IdUsager) REFERENCES Usagers(Id)
)
