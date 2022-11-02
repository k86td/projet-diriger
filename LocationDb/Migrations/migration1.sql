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
-- :setvar DefaultDataPath "C:\Users\tlepine\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
-- :setvar DefaultLogPath "C:\Users\tlepine\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Création de la base de données $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Création de Table [dbo].[CategoriesOffres]...';


GO
CREATE TABLE [dbo].[CategoriesOffres] (
    [Id]     INT          IDENTITY (1, 1) NOT NULL,
    [IdType] INT          NOT NULL,
    [Nom]    VARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Nom] ASC)
);


GO
PRINT N'Création de Table [dbo].[Conversations]...';


GO
CREATE TABLE [dbo].[Conversations] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [IdAuteur]       INT           NOT NULL,
    [IdDestinataire] INT           NOT NULL,
    [Contenu]        VARCHAR (100) NOT NULL,
    [Date]           DATETIME2 (7) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[Demandes]...';


GO
CREATE TABLE [dbo].[Demandes] (
    [IdUsager] INT           NOT NULL,
    [Date]     DATETIME2 (7) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdUsager] ASC)
);


GO
PRINT N'Création de Table [dbo].[DemandesOffres]...';


GO
CREATE TABLE [dbo].[DemandesOffres] (
    [IdOffre]  INT           NOT NULL,
    [IdUsager] INT           NOT NULL,
    [Date]     DATETIME2 (7) NULL,
    [Accepter] BIT           NULL,
    PRIMARY KEY CLUSTERED ([IdOffre] ASC, [IdUsager] ASC)
);


GO
PRINT N'Création de Table [dbo].[Offres]...';


GO
CREATE TABLE [dbo].[Offres] (
    [Id]               INT           IDENTITY (1, 1) NOT NULL,
    [Nom]              VARCHAR (25)  NULL,
    [IdVendeur]        INT           NOT NULL,
    [Prix]             MONEY         NOT NULL,
    [Coordonner]       VARCHAR (50)  NOT NULL,
    [IdCategorieOffre] INT           NULL,
    [IdTypeOffre]      INT           NULL,
    [dateDebut]        DATETIME2 (7) NOT NULL,
    [dateFin]          DATETIME2 (7) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[Ratings]...';


GO
CREATE TABLE [dbo].[Ratings] (
    [IdOffre]  INT NOT NULL,
    [IdUsager] INT NOT NULL,
    [Rating]   INT NOT NULL,
    PRIMARY KEY CLUSTERED ([IdOffre] ASC, [IdUsager] ASC)
);


GO
PRINT N'Création de Table [dbo].[Roles]...';


GO
CREATE TABLE [dbo].[Roles] (
    [Id]  INT          IDENTITY (1, 1) NOT NULL,
    [Nom] VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Nom] ASC)
);


GO
PRINT N'Création de Table [dbo].[TypesOffres]...';


GO
CREATE TABLE [dbo].[TypesOffres] (
    [Id]  INT          IDENTITY (1, 1) NOT NULL,
    [Nom] VARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Nom] ASC)
);


GO
PRINT N'Création de Table [dbo].[Usagers]...';


GO
CREATE TABLE [dbo].[Usagers] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [IdRole]    INT           NOT NULL,
    [Nom]       VARCHAR (50)  NOT NULL,
    [Prenom]    VARCHAR (50)  NOT NULL,
    [Email]     VARCHAR (50)  NOT NULL,
    [Telephone] VARCHAR (15)  NOT NULL,
    [Password]  VARCHAR (100) NOT NULL,
    [Adresse]   VARCHAR (100) NOT NULL,
    [Age]       INT           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC)
);


GO
PRINT N'Création de Table [dbo].[Vendeurs]...';


GO
CREATE TABLE [dbo].[Vendeurs] (
    [IdUsager]     INT           NOT NULL,
    [DateAccepter] DATETIME2 (7) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdUsager] ASC)
);


GO
PRINT N'Création de Table [dbo].[Voitures]...';


GO
CREATE TABLE [dbo].[Voitures] (
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


GO
PRINT N'Création de Contrainte par défaut contrainte sans nom sur [dbo].[Conversations]...';


GO
ALTER TABLE [dbo].[Conversations]
    ADD DEFAULT GETDATE() FOR [Date];


GO
PRINT N'Création de Contrainte par défaut contrainte sans nom sur [dbo].[Demandes]...';


GO
ALTER TABLE [dbo].[Demandes]
    ADD DEFAULT GETDATE() FOR [Date];


GO
PRINT N'Création de Contrainte par défaut contrainte sans nom sur [dbo].[DemandesOffres]...';


GO
ALTER TABLE [dbo].[DemandesOffres]
    ADD DEFAULT GETDATE() FOR [Date];


GO
PRINT N'Création de Contrainte par défaut contrainte sans nom sur [dbo].[DemandesOffres]...';


GO
ALTER TABLE [dbo].[DemandesOffres]
    ADD DEFAULT 0 FOR [Accepter];


GO
PRINT N'Création de Contrainte par défaut contrainte sans nom sur [dbo].[Vendeurs]...';


GO
ALTER TABLE [dbo].[Vendeurs]
    ADD DEFAULT GETDATE() FOR [DateAccepter];


GO
PRINT N'Création de Clé étrangère [dbo].[FK_TypesOffres]...';


GO
ALTER TABLE [dbo].[CategoriesOffres]
    ADD CONSTRAINT [FK_TypesOffres] FOREIGN KEY ([IdType]) REFERENCES [dbo].[TypesOffres] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Usagers_Auteur]...';


GO
ALTER TABLE [dbo].[Conversations]
    ADD CONSTRAINT [FK_Usagers_Auteur] FOREIGN KEY ([IdAuteur]) REFERENCES [dbo].[Usagers] ([Id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Usagers_Destinataires]...';


GO
ALTER TABLE [dbo].[Conversations]
    ADD CONSTRAINT [FK_Usagers_Destinataires] FOREIGN KEY ([IdDestinataire]) REFERENCES [dbo].[Usagers] ([Id]);


GO
PRINT N'Création de Clé étrangère [dbo].[fk_demandes_usagers]...';


GO
ALTER TABLE [dbo].[Demandes]
    ADD CONSTRAINT [fk_demandes_usagers] FOREIGN KEY ([IdUsager]) REFERENCES [dbo].[Usagers] ([Id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Offres_Demande]...';


GO
ALTER TABLE [dbo].[DemandesOffres]
    ADD CONSTRAINT [FK_Offres_Demande] FOREIGN KEY ([IdOffre]) REFERENCES [dbo].[Offres] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Usagers_Demande]...';


GO
ALTER TABLE [dbo].[DemandesOffres]
    ADD CONSTRAINT [FK_Usagers_Demande] FOREIGN KEY ([IdUsager]) REFERENCES [dbo].[Usagers] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Création de Clé étrangère [dbo].[fk_offres_typeOffre]...';


GO
ALTER TABLE [dbo].[Offres]
    ADD CONSTRAINT [fk_offres_typeOffre] FOREIGN KEY ([IdTypeOffre]) REFERENCES [dbo].[TypesOffres] ([Id]);


GO
PRINT N'Création de Clé étrangère [dbo].[fk_offres_categorieOffre]...';


GO
ALTER TABLE [dbo].[Offres]
    ADD CONSTRAINT [fk_offres_categorieOffre] FOREIGN KEY ([IdCategorieOffre]) REFERENCES [dbo].[CategoriesOffres] ([Id]);


GO
PRINT N'Création de Clé étrangère [dbo].[fk_offres_vendeurs]...';


GO
ALTER TABLE [dbo].[Offres]
    ADD CONSTRAINT [fk_offres_vendeurs] FOREIGN KEY ([IdVendeur]) REFERENCES [dbo].[Vendeurs] ([IdUsager]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Offres_Rating]...';


GO
ALTER TABLE [dbo].[Ratings]
    ADD CONSTRAINT [FK_Offres_Rating] FOREIGN KEY ([IdOffre]) REFERENCES [dbo].[Offres] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Usagers_Rating]...';


GO
ALTER TABLE [dbo].[Ratings]
    ADD CONSTRAINT [FK_Usagers_Rating] FOREIGN KEY ([IdUsager]) REFERENCES [dbo].[Usagers] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Création de Clé étrangère [dbo].[fk_vendeurs_usagers]...';


GO
ALTER TABLE [dbo].[Vendeurs]
    ADD CONSTRAINT [fk_vendeurs_usagers] FOREIGN KEY ([IdUsager]) REFERENCES [dbo].[Usagers] ([Id]);


GO
PRINT N'Création de Clé étrangère [dbo].[fk_voitures_offres]...';


GO
ALTER TABLE [dbo].[Voitures]
    ADD CONSTRAINT [fk_voitures_offres] FOREIGN KEY ([IdOffre]) REFERENCES [dbo].[Offres] ([Id]);


GO
PRINT N'Création de Contrainte de validation [dbo].[chk_offres_prix]...';


GO
ALTER TABLE [dbo].[Offres]
    ADD CONSTRAINT [chk_offres_prix] CHECK (Prix > 0);


GO
PRINT N'Création de Contrainte de validation [dbo].[chk_ratings_rating]...';


GO
ALTER TABLE [dbo].[Ratings]
    ADD CONSTRAINT [chk_ratings_rating] CHECK (Rating >= 1 and Rating <=5);


GO
PRINT N'Création de Procédure [dbo].[AddCategorieOffre]...';


GO
CREATE PROCEDURE [dbo].[AddCategorieOffre]
	@IdType INT,
	@Nom VARCHAR(30),
	@IdCategorieOffre INT OUT
AS
BEGIN
	INSERT INTO dbo.CategoriesOffres (IdType, Nom)
	VALUES (@IdType, @Nom);

	SET @IdCategorieOffre = SCOPE_IDENTITY();
END;
GO
PRINT N'Création de Procédure [dbo].[AddConversation]...';


GO
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
GO
PRINT N'Création de Procédure [dbo].[AddDemande]...';


GO
CREATE PROCEDURE [dbo].[AddDemande]
	@IdUser int
AS
BEGIN
	INSERT INTO dbo.Demandes (IdUsager) VALUES (@IdUser);
END
GO
PRINT N'Création de Procédure [dbo].[AddDemandeOffre]...';


GO
CREATE PROCEDURE [dbo].[AddDemandeOffre]
	@IdOffre INT,
	@IdUsager INT,
	@Date DATETIME2(7)
AS
BEGIN
	INSERT INTO dbo.DemandesOffres (IdOffre, IdUsager, [Date])
	VALUES (@IdOffre, @IdUsager, @Date);
END;
GO
PRINT N'Création de Procédure [dbo].[AddOffre]...';


GO
CREATE PROCEDURE [dbo].[AddOffre]
	@IdVendeur int,
	@Prix float,
	@Coordonner varchar(50),
	@Nom VARCHAR(50), 
	@IdCategorieOffre INT, 
	@IdTypeOffre INT,
	@OffreId INT OUT,
	@DateDebut DATETIME2,
	@DateFin DATETIME2
	
AS
BEGIN
	INSERT INTO Offres (IdVendeur, Prix, Coordonner, Nom, IdCategorieOffre, IdTypeOffre, dateDebut, dateFin)
	VALUES (@IdVendeur, @Prix, @Coordonner, @Nom, @IdCategorieOffre, @IdTypeOffre, @DateDebut, @DateFin)

	SET @OffreId = SCOPE_IDENTITY();
END
GO
PRINT N'Création de Procédure [dbo].[AddRating]...';


GO
CREATE PROCEDURE [dbo].[AddRating]
	@idOffre int,
	@idUsager int,
	@rating  int
AS
BEGIN
	INSERT INTO dbo.Ratings (IdOffre, IdUsager, Rating) VALUES (@idOffre,@idUsager,@rating); 
END
GO
PRINT N'Création de Procédure [dbo].[AddRoles]...';


GO
CREATE PROCEDURE [dbo].[AddRoles]
	@Nom varchar(20)
AS
BEGIN
	INSERT INTO Roles (Nom) VALUES (@Nom);
END
GO
PRINT N'Création de Procédure [dbo].[AddTypeOffre]...';


GO
CREATE PROCEDURE [dbo].[AddTypeOffre]
	@Nom varchar(30)
AS
BEGIN
	INSERT INTO dbo.TypesOffres (Nom) VALUES(@Nom);
END
GO
PRINT N'Création de Procédure [dbo].[AddUsager]...';


GO
CREATE PROCEDURE [dbo].[AddUsager]
	@IdRole int,
	@Nom varchar(50),
	@Prenom varchar(50),
	@Email varchar(50),
	@Telephone varchar(15),
	@Password varchar(100),
	@Adresse varchar(100),
	@Age int
AS
BEGIN
	INSERT INTO Usagers (IdRole, Nom, Prenom, Email, Telephone, [Password], Adresse, Age)
	VALUES				(@IdRole,@Nom,@Prenom,@Email,@Telephone,@Password,@Adresse, @Age)
END
GO
PRINT N'Création de Procédure [dbo].[AddVendeur]...';


GO
CREATE PROCEDURE [dbo].[AddVendeur]
	@IdUsager int
AS
BEGIN
	INSERT INTO dbo.Vendeurs (IdUsager) VALUES (@IdUsager);
END
GO
PRINT N'Création de Procédure [dbo].[CreateVoiture]...';


GO
CREATE PROCEDURE [dbo].[CreateVoiture]
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
PRINT N'Création de Procédure [dbo].[DeleteConversation]...';


GO
CREATE PROCEDURE [dbo].[DeleteConversation]
	@Id int
AS
BEGIN
	DELETE FROM Conversations WHERE Id = @Id;
END
GO
PRINT N'Création de Procédure [dbo].[DeleteDemande]...';


GO
CREATE PROCEDURE [dbo].[DeleteDemande]
	@IdUser int
AS
BEGIN
	DELETE FROM dbo.Demandes WHERE IdUsager = @IdUser;
END
GO
PRINT N'Création de Procédure [dbo].[DeleteOffre]...';


GO
CREATE PROCEDURE [dbo].[DeleteOffre]
	@Id int
AS
BEGIN
	DELETE FROM Offres WHERE Id = @Id;
END
GO
PRINT N'Création de Procédure [dbo].[DeleteRating]...';


GO
CREATE PROCEDURE [dbo].[DeleteRating]
	@IdUsager int,
	@IdOffre int
AS
BEGIN
	DELETE FROM dbo.Ratings WHERE IdOffre = @IdOffre AND IdUsager = @IdUsager;
END
GO
PRINT N'Création de Procédure [dbo].[DeleteRole]...';


GO
CREATE PROCEDURE [dbo].[DeleteRole]
	@Id int
AS
BEGIN
	DELETE FROM Roles WHERE Id = @Id;
END
GO
PRINT N'Création de Procédure [dbo].[DeleteTypeOffre]...';


GO
CREATE PROCEDURE [dbo].[DeleteTypeOffre]
	@Id int
AS
BEGIN
	DELETE FROM dbo.TypesOffres WHERE id = @Id;
END
GO
PRINT N'Création de Procédure [dbo].[DeleteUser]...';


GO
CREATE PROCEDURE [dbo].[DeleteUser]
	@Id int
AS
BEGIN
	DELETE FROM Usagers WHERE Id = @Id;
END
GO
PRINT N'Création de Procédure [dbo].[DeleteVendeur]...';


GO
CREATE PROCEDURE [dbo].[DeleteVendeur]
	@IdUsager int
AS
BEGIN
	DELETE FROM dbo.Vendeurs WHERE IdUsager = @IdUsager;
END
GO
PRINT N'Création de Procédure [dbo].[DeleteVoiture]...';


GO
CREATE PROCEDURE [dbo].[DeleteVoiture]
	@IdOffre INT
AS
BEGIN
	DELETE dbo.Voitures
	WHERE IdOffre = @IdOffre;
END;
GO
PRINT N'Création de Procédure [dbo].[EditVendeur]...';


GO
CREATE PROCEDURE [dbo].[EditVendeur]
	@IdUsager int,
	@DateAccepter Datetime
AS
BEGIN
	UPDATE dbo.Vendeurs 
	SET DateAccepter = @DateAccepter
	WHERE IdUsager =  @IdUsager
END
GO
PRINT N'Création de Procédure [dbo].[EditVoiture]...';


GO
CREATE PROCEDURE [dbo].[EditVoiture]
	@IdOffre INT,
	@Annee INT,
	@Couleur VARCHAR(30),
	@Marque VARCHAR(30),
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
	UPDATE dbo.Voitures
	SET 
		Annee = @Annee,
		Couleur = @Couleur,
		Marque = @Marque,
		Odometre = @Odometre,
		TypeVehicule = @TypeVehicule,
		NombrePorte = @NombrePorte,
		NombreSiege = @NombreSiege,
		Carburant = @Carburant,
		Traction = @Traction,
		[Description] = @Description,
		Accidente = @Accidente
	WHERE IdOffre = @IdOffre
END;
GO
PRINT N'Création de Procédure [dbo].[GetAllConversations]...';


GO
CREATE PROCEDURE [dbo].[GetAllConversations]
AS
BEGIN
	SELECT * FROM Conversations;
END
GO
PRINT N'Création de Procédure [dbo].[GetAllOfferRatings]...';


GO
CREATE PROCEDURE [dbo].[GetAllOfferRatings]
	@IdOffre int
AS
BEGIN
	SELECT Rating,Nom,Prenom FROM dbo.Ratings INNER JOIN dbo.Usagers ON Ratings.IdUsager = Usagers.Id 
	WHERE IdOffre = @IdOffre;
END
GO
PRINT N'Création de Procédure [dbo].[GetAllRatings]...';


GO
CREATE PROCEDURE [dbo].[GetAllRatings]
AS
BEGIN
	SELECT * FROM dbo.Ratings;
END
GO
PRINT N'Création de Procédure [dbo].[GetAllRoles]...';


GO
CREATE PROCEDURE [dbo].[GetAllRoles]
AS
BEGIN
	SELECT * FROM Roles;
END
GO
PRINT N'Création de Procédure [dbo].[GetAllTypesOffre]...';


GO
CREATE PROCEDURE [dbo].[GetAllTypesOffre]
AS
BEGIN
	SELECT * FROM TypesOffres;
END
GO
PRINT N'Création de Procédure [dbo].[GetAllVendeurs]...';


GO
CREATE PROCEDURE [dbo].[GetAllVendeurs]
AS
BEGIN
	SELECT * FROM dbo.Vendeurs;
END
GO
PRINT N'Création de Procédure [dbo].[GetOffre]...';


GO
CREATE PROCEDURE [dbo].[GetOffre]
	@Id int
AS
BEGIN
	SELECT * FROM Offres WHERE Id = @Id;
END
GO
PRINT N'Création de Procédure [dbo].[GetOffresBySellerId]...';


GO
CREATE PROCEDURE [dbo].[GetOffresBySellerId]
	@Id int
AS
BEGIN
	SELECT * FROM dbo.Offres WHERE IdVendeur = @Id;
END
GO
PRINT N'Création de Procédure [dbo].[GetSentByUserConversations]...';


GO
CREATE PROCEDURE [dbo].[GetSentByUserConversations]
	@IdUsager int
AS
BEGIN
	SELECT Conversations.Contenu, Usagers.Nom, Usagers.Prenom
	FROM dbo.Conversations INNER JOIN dbo.Usagers ON Conversations.IdAuteur = Usagers.Id
END
GO
PRINT N'Création de Procédure [dbo].[GetUsager]...';


GO
CREATE PROCEDURE [dbo].[GetUsager]
	@Id int
AS
BEGIN
	SELECT * FROM Usagers WHERE Id = @Id;
END
GO
PRINT N'Création de Procédure [dbo].[GetVoiture]...';


GO
CREATE PROCEDURE [dbo].[GetVoiture]
AS
BEGIN
	SELECT * FROM dbo.Voitures;
END;
GO
PRINT N'Création de Procédure [dbo].[RemoveDemandeOffre]...';


GO
CREATE PROCEDURE [dbo].[RemoveDemandeOffre]
	@IdOffre INT,
	@IdUsager INT
AS
BEGIN
	DELETE FROM dbo.DemandesOffres 
	WHERE IdOffre = @IdOffre AND IdUsager = @IdUsager;
END;
GO
PRINT N'Création de Procédure [dbo].[UpdateConversation]...';


GO
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
GO
PRINT N'Création de Procédure [dbo].[UpdateOffre]...';


GO
CREATE PROCEDURE [dbo].[UpdateOffre]
	@Id int,
	@IdVendeur int,
	@Prix varchar(50),
	@Date varchar(50),
	@Coordonner varchar(50),
	@DateDebut DATETIME2,
	@DateFin DATETIME2
	
AS
BEGIN
	UPDATE Offres
	SET	   IdVendeur = @IdVendeur,
		   Prix = @Prix,
		   Coordonner = @Coordonner,
		   dateDebut = @DateDebut,
		   dateFin = @DateFin
		
	WHERE Id = @Id;
END
GO
PRINT N'Création de Procédure [dbo].[UpdateRating]...';


GO
CREATE PROCEDURE [dbo].[UpdateRating]
	@idUsager int,
	@idOffre int,
	@rating int
AS
BEGIN
	UPDATE dbo.Ratings
	SET Rating = @rating
	WHERE IdOffre = @idOffre AND IdUsager = @idUsager;
END
GO
PRINT N'Création de Procédure [dbo].[UpdateRole]...';


GO
CREATE PROCEDURE [dbo].[UpdateRole]
	@Id int,
	@Nom varchar(20)
AS
BEGIN
	UPDATE Roles
	SET Nom = @Nom
	WHERE Id = @Id;
END
GO
PRINT N'Création de Procédure [dbo].[UpdateTypeOffre]...';


GO
CREATE PROCEDURE [dbo].[UpdateTypeOffre]
	@Id int,
	@Nom varchar(30)
AS
BEGIN
	UPDATE TypesOffres
	SET Nom = @Nom
	WHERE Id = @Id;
END
GO
PRINT N'Création de Procédure [dbo].[UpdateUsager]...';


GO
CREATE PROCEDURE [dbo].[UpdateUsager]
	@Id int,
	@IdRole int,
	@Nom varchar(50),
	@Prenom varchar(50),
	@Email varchar(50),
	@Telephone varchar(15),
	@Password varchar(100),
	@Adresse varchar(100),
	@Age int
AS
BEGIN
	UPDATE Usagers
	SET	   IdRole = @IdRole,
		   Nom = @Nom,
		   Prenom = @Prenom,
		   Email = @Email,
		   Telephone = @Telephone,
		   [Password] = @Password,
		   Adresse = @Adresse,
		   Age = @Age
	WHERE Id = @Id;
END
GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Mise à jour terminée.';


GO
