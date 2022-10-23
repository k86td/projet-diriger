CREATE PROCEDURE [dbo].[AddDemandeOffre]
	@IdOffre INT,
	@IdUsager INT,
	@Date DATETIME2(7)
AS
BEGIN
	INSERT INTO dbo.DemandesOffres (IdOffre, IdUsager, [Date])
	VALUES (@IdOffre, @IdUsager, @Date);
END;