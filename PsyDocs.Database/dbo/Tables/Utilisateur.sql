CREATE TABLE [dbo].[Utilisateur] (
    [Id]                UNIQUEIDENTIFIER NOT NULL,
    [Nom]               NVARCHAR (100)   NOT NULL,
    [Prenom]            NVARCHAR (100)   NOT NULL,
    [NumeroTelephone]   NVARCHAR (100)   NULL,
    [Courriel]          NVARCHAR (255)   NOT NULL,
    [MotDePasse]        NVARCHAR (100)   NOT NULL,
    [DateExpiration]    DATETIME2 (7)    NULL,
    [EstAdministrateur] BIT              CONSTRAINT [DF_Utilisateur_EstAdministrateur] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_dbo.Utilisateur] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [IX_Utilisateur_Courriel_Unique] UNIQUE NONCLUSTERED ([Courriel] ASC)
);

