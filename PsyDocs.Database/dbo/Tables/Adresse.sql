CREATE TABLE [dbo].[Adresse] (
    [Id]             UNIQUEIDENTIFIER NOT NULL,
    [AdresseCivique] NVARCHAR (255)   NULL,
    [CodePostal]     NVARCHAR (6)     NULL,
    [Province]       NVARCHAR (100)   NULL,
    [Pays]           NVARCHAR (100)   NULL,
    [Ville]          NVARCHAR (100)   NULL,
    CONSTRAINT [PK_dbo.Adresse] PRIMARY KEY CLUSTERED ([Id] ASC)
);

