CREATE TABLE [dbo].[Dossier] (
    [Id]                   UNIQUEIDENTIFIER CONSTRAINT [DF_Dossier_Id] DEFAULT (newid()) NOT NULL,
    [UtilisateurId]        UNIQUEIDENTIFIER NOT NULL,
    [ModaliteTraitementId] UNIQUEIDENTIFIER NOT NULL,
    [Numero]               NVARCHAR (50)    NOT NULL,
    [Ouverture]            DATETIME2 (7)    NOT NULL,
    [Fermeture]            DATETIME2 (7)    NULL,
    CONSTRAINT [PK_dbo.Dossier] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Dossier_ModaliteTraitement] FOREIGN KEY ([ModaliteTraitementId]) REFERENCES [dbo].[ModaliteTraitement] ([Id]),
    CONSTRAINT [FK_Dossier_Utilisateur] FOREIGN KEY ([UtilisateurId]) REFERENCES [dbo].[Utilisateur] ([Id])
);



