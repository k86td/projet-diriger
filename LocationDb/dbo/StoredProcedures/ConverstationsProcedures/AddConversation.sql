CREATE PROCEDURE [dbo].[AddConversation]
	@IdAuteur int,
	@IdDestinataire int,
	@Contenu varchar(100),
	@Date Datetime
AS
BEGIN
	INSERT INTO dbo.Conversations (IdAuteur,IdDestinataire,Contenu,[Date])
	VALUES (@IdAuteur, @IdDestinataire, @Contenu, @Date);
END
