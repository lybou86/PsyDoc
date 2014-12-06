CREATE TABLE [dbo].[Client] (
    [Id]                      UNIQUEIDENTIFIER NOT NULL,
    [AdresseId]               UNIQUEIDENTIFIER NOT NULL,
    [DossierId]               UNIQUEIDENTIFIER NOT NULL,
    [Nom]                     NVARCHAR (100)   NOT NULL,
    [Prenom]                  NVARCHAR (100)   NOT NULL,
    [NumeroTelephone]         NVARCHAR (100)   NOT NULL,
    [Sexe]                    INT              NOT NULL,
    [Courriel]                NVARCHAR (100)   NULL,
    [DateDeNaissance]         DATETIME2 (0)    NULL,
    [Reference]               NVARCHAR (MAX)   NULL,
    [NomAssureur]             NVARCHAR (MAX)   NULL,
    [NumeroTelephoneAssureur] NVARCHAR (100)   NULL,
    CONSTRAINT [PK_dbo.Client] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.Client_dbo.Adresse_AdresseId] FOREIGN KEY ([AdresseId]) REFERENCES [dbo].[Adresse] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.Client_dbo.Dossier_DossierId] FOREIGN KEY ([DossierId]) REFERENCES [dbo].[Dossier] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_AdresseId]
    ON [dbo].[Client]([AdresseId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DossierId]
    ON [dbo].[Client]([DossierId] ASC);

