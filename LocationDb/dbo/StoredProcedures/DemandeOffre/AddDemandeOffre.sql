CREATE PROCEDURE [dbo].[AddDemandeOffre]
	@IdOffre INT,
	@IdUsager INT,
	@Date DATETIME2(7),
	@OrderId VARCHAR(50)
AS
BEGIN
	INSERT INTO dbo.DemandesOffres (IdOffre, IdUsager, [Date], OrderId)
	VALUES (@IdOffre, @IdUsager, @Date, @OrderId);
END;