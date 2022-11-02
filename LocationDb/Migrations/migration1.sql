/*
Script de déploiement pour LocationDb

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "LocationDb"
:setvar DefaultFilePrefix "LocationDb"
:setvar DefaultDataPath "C:\Users\tlepine\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\tlepine\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Détectez le mode SQLCMD et désactivez l'exécution du script si le mode SQLCMD n'est pas pris en charge.
Pour réactiver le script une fois le mode SQLCMD activé, exécutez ce qui suit :
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Le mode SQLCMD doit être activé de manière à pouvoir exécuter ce script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
La colonne [dbo].[Voitures].[Annee] de la table [dbo].[Voitures] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.

La colonne [dbo].[Voitures].[Carburant] de la table [dbo].[Voitures] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[Voitures])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'Suppression de Clé étrangère [dbo].[fk_voitures_offres]...';


GO
ALTER TABLE [dbo].[Voitures] DROP CONSTRAINT [fk_voitures_offres];


GO
PRINT N'Début de la régénération de la table [dbo].[Voitures]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Voitures] (
    [IdOffre]      INT           NOT NULL,
    [Annee]        INT           NOT NULL,
    [Couleur]      VARCHAR (30)  NOT NULL,
    [Marque]       VARCHAR (30)  NOT NULL,
    [Modele]       VARCHAR (30)  NOT NULL,
    [Odometre]     INT           NOT NULL,
    [TypeVehicule] VARCHAR (30)  NOT NULL,
    [NombrePorte]  INT           NOT NULL,
    [NombreSiege]  INT           NOT NULL,
    [Carburant]    VARCHAR (30)  NOT NULL,
    [Traction]     VARCHAR (50)  NOT NULL,
    [Description]  VARCHAR (100) NOT NULL,
    [Accidente]    BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([IdOffre] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Voitures])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Voitures] ([IdOffre], [Couleur], [Marque], [Modele], [Odometre], [TypeVehicule], [NombrePorte], [NombreSiege], [Traction], [Description], [Accidente])
        SELECT   [IdOffre],
                 [Couleur],
                 [Marque],
                 [Modele],
                 [Odometre],
                 [TypeVehicule],
                 [NombrePorte],
                 [NombreSiege],
                 [Traction],
                 [Description],
                 [Accidente]
        FROM     [dbo].[Voitures]
        ORDER BY [IdOffre] ASC;
    END

DROP TABLE [dbo].[Voitures];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Voitures]', N'Voitures';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Création de Clé étrangère [dbo].[fk_voitures_offres]...';


GO
ALTER TABLE [dbo].[Voitures] WITH NOCHECK
    ADD CONSTRAINT [fk_voitures_offres] FOREIGN KEY ([IdOffre]) REFERENCES [dbo].[Offres] ([Id]);


GO
PRINT N'Modification de Procédure [dbo].[CreateVoiture]...';


GO
ALTER PROCEDURE [dbo].[CreateVoiture]
	@IdOffre INT,
	@Annee INT,
	@Couleur VARCHAR(30),
	@Marque VARCHAR(30),
	@Modele VARCHAR(30),
	@Odometre INT,
	@TypeVehicule VARCHAR(30),
	@NombrePorte INT,
	@NombreSiege INT,
	@Carburant VARCHAR(30),
	@Traction VARCHAR(50),
	@Description VARCHAR(100),
	@Accidente BIT
AS
BEGIN
	INSERT INTO dbo.Voitures (
		IdOffre, Annee, Couleur, Marque, Modele, Odometre, TypeVehicule,
		NombrePorte, NombreSiege, Carburant, Traction, [Description],
		Accidente)
		VALUES (@IdOffre,@Annee, @Couleur, @Marque, @Modele, @Odometre, 
		@TypeVehicule, @NombrePorte, @NombreSiege, @Carburant, 
		@Traction, @Description, @Accidente);
END;
GO
PRINT N'Modification de Procédure [dbo].[EditVoiture]...';


GO
ALTER PROCEDURE [dbo].[EditVoiture]
	@IdOffre INT,
	@Annee INT,
	@Couleur VARCHAR(30),
	@Marque VARCHAR(30),
	@Odometre INT,
	@TypeVehicule VARCHAR(30),
	@NombrePorte INT,
	@NombreSiege INT,
	@Traction VARCHAR(50),
	@Description VARCHAR(100),
	@Accidente BIT
AS
BEGIN
	UPDATE dbo.Voitures
	SET 
		Annee = @Annee,
		Couleur = @Couleur,
		Marque = @Marque,
		Odometre = @Odometre,
		TypeVehicule = @TypeVehicule,
		NombrePorte = @NombrePorte,
		NombreSiege = @NombreSiege,
		Traction = @Traction,
		[Description] = @Description,
		Accidente = @Accidente
	WHERE IdOffre = @IdOffre
END;
GO
PRINT N'Actualisation de Procédure [dbo].[DeleteVoiture]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[DeleteVoiture]';


GO
PRINT N'Actualisation de Procédure [dbo].[GetVoiture]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[GetVoiture]';


GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Voitures] WITH CHECK CHECK CONSTRAINT [fk_voitures_offres];


GO
PRINT N'Mise à jour terminée.';


GO
