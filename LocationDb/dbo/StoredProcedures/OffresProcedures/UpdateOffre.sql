CREATE PROCEDURE [dbo].[UpdateOffre]
	@Id int,
	@IdVendeur int,
	@Prix varchar(50),
	@Date varchar(50),
	@Coordonner varchar(50)
AS
BEGIN
	UPDATE Offres
	SET	   IdVendeur = @IdVendeur,
		   Prix = @Prix,
		   [Date] = @Date,
		   Coordonner = @Coordonner
	WHERE Id = @Id;
END