/*
Modèle de script de post-déploiement							
--------------------------------------------------------------------------------------
 Ce fichier contient des instructions SQL qui seront ajoutées au script de compilation.		
 Utilisez la syntaxe SQLCMD pour inclure un fichier dans le script de post-déploiement.			
 Exemple :      :r .\monfichier.sql								
 Utilisez la syntaxe SQLCMD pour référencer une variable dans le script de post-déploiement.		
 Exemple :      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


USE LocationDb;


-- insert roles
INSERT INTO dbo.Roles (Id, Nom)
VALUES (2, 'Admin');


/*INSERT INTO dbo.Roles (Id, Nom)
VALUES (2002, 'User');*/

-- insert types
INSERT INTO dbo.TypesOffres (Id, Nom)
VALUES (1, 'Voiture');

-- insert categories
INSERT INTO dbo.CategoriesOffres (Id, IdType, Nom)
VALUES (1, 1, 'Vus');
INSERT INTO dbo.CategoriesOffres (Id, IdType, Nom)
VALUES (2, 1, 'Sport');
INSERT INTO dbo.CategoriesOffres (Id, IdType, Nom)
VALUES (3, 1, 'Berline');
INSERT INTO dbo.CategoriesOffres (Id, IdType, Nom)
VALUES (4, 1, 'Hatchback');

