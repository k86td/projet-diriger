CREATE PROCEDURE [dbo].[UpdateConversation]
	@Id int,
	@IdAuteur int,
	@IdDestinataire int,
	@Contenu varchar(100),
	@Date DateTime
AS
BEGIN
	UPDATE dbo.Conversations 
	SET IdAuteur = @IdAuteur,
		IdDestinataire = @IdDestinataire,
		Contenu = @Contenu,
		[Date] = @Date
	WHERE Id = @Id;
END
