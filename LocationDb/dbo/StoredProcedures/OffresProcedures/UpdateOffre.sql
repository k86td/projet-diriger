CREATE PROCEDURE [dbo].[UpdateOffre]
	@Id int,
	@IdVendeur int,
	@Prix varchar(50),
	@Date varchar(50),
	@Coordonner varchar(50),
	@DateDebut DATETIME2,
	@DateFin DATETIME2,
	@image VARCHAR(50)
	
AS
BEGIN
	UPDATE Offres
	SET	   IdVendeur = @IdVendeur,
		   Prix = @Prix,
		   Coordonner = @Coordonner,
		   dateDebut = @DateDebut,
		   dateFin = @DateFin,
		   [image] = @image
		
	WHERE Id = @Id;
END