CREATE TABLE [dbo].[Therapie] (
    [Id]          UNIQUEIDENTIFIER NOT NULL,
    [DossierId]   UNIQUEIDENTIFIER NOT NULL,
    [Nom]         NVARCHAR (50)    NOT NULL,
    [Description] NVARCHAR (255)   NOT NULL,
    CONSTRAINT [PK_dbo.Therapie] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.Therapie_dbo.Dossier_DossierId] FOREIGN KEY ([DossierId]) REFERENCES [dbo].[Dossier] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_DossierId]
    ON [dbo].[Therapie]([DossierId] ASC);

