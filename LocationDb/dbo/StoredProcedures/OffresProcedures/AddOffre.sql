CREATE PROCEDURE [dbo].[AddOffre]
	@Id int, 
	@IdVendeur int,
	@Prix float,
	@Date DateTime,
	@Coordonner varchar(50)
AS
BEGIN
	INSERT INTO Offres (IdVendeur, Prix, [Date], Coordonner)
	VALUES (@IdVendeur, @Prix, @Date, @Coordonner)
END