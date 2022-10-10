CREATE PROCEDURE [dbo].[AddDemandeOffre]
	@IdOffre INT,
	@IdUsager INT
AS
BEGIN
	INSERT INTO dbo.DemandesOffres (IdOffre, IdUsager)
	VALUES (@IdOffre, @IdUsager);
END;