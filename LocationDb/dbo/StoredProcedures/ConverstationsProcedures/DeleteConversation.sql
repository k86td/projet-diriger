CREATE PROCEDURE [dbo].[DeleteConversation]
	@Id int
AS
BEGIN
	DELETE FROM Conversations WHERE Id = @Id;
END