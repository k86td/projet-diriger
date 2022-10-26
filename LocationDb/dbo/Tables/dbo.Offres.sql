CREATE TABLE [dbo].[Offres] (
    [Id]               INT           IDENTITY (1, 1) NOT NULL,
    [Nom]              VARCHAR (25)  NULL,
    [IdVendeur]        INT           NOT NULL,
    [Prix]             MONEY         NOT NULL,
    [Coordonner]       VARCHAR (100)  NOT NULL,
    [IdCategorieOffre] INT           NULL,
    [IdTypeOffre]      INT           NULL,
    [dateDebut]        DATETIME2 (7) NOT NULL,
    [dateFin]          DATETIME2 (7) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [fk_offres_typeOffre] FOREIGN KEY ([IdTypeOffre]) REFERENCES [dbo].[TypesOffres] ([Id]),
    CONSTRAINT [fk_offres_categorieOffre] FOREIGN KEY ([IdCategorieOffre]) REFERENCES [dbo].[CategoriesOffres] ([Id]),
    CONSTRAINT [fk_offres_vendeurs] FOREIGN KEY ([IdVendeur]) REFERENCES [dbo].[Vendeurs] ([IdUsager]),
    CONSTRAINT [chk_offres_prix] CHECK ([Prix]>(0))
);

