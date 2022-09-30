CREATE PROCEDURE [dbo].[DeleteDemande]
	@IdUser int
AS
BEGIN
	DELETE FROM dbo.Demandes WHERE IdUsager = @IdUser;
END
