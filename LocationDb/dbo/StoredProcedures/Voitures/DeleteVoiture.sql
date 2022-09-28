CREATE PROCEDURE [dbo].[DeleteVoiture]
	@IdOffre INT
AS
BEGIN
	DELETE dbo.Voitures
	WHERE IdOffre = @IdOffre;
END;
