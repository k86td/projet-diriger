CREATE PROCEDURE [dbo].[AddDemande]
	@IdUser int
AS
BEGIN
	INSERT INTO dbo.Demandes (IdUsager) VALUES (@IdUser);
END
