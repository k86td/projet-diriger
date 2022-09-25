CREATE PROCEDURE [dbo].[GetSentByUserConversations]
	@IdUsager int
AS
BEGIN
	SELECT Conversations.Contenu, Usagers.Nom, Usagers.Prenom
	FROM dbo.Conversations INNER JOIN dbo.Usagers ON Conversations.IdAuteur = Usagers.Id
END
