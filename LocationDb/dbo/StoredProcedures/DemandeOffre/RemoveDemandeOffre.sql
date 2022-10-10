CREATE PROCEDURE [dbo].[RemoveDemandeOffre]
	@IdOffre INT,
	@IdUsager INT
AS
BEGIN
	DELETE FROM dbo.DemandesOffres 
	WHERE IdOffre = @IdOffre AND IdUsager = @IdUsager;
END;
