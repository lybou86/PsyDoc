CREATE TABLE [dbo].[Seance] (
    [Id]          UNIQUEIDENTIFIER NOT NULL,
    [TherapieId]  UNIQUEIDENTIFIER NOT NULL,
    [Date]        DATETIME2 (7)    NOT NULL,
    [Duree]       TIME (7)         NOT NULL,
    [AideMemoire] NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_dbo.Seance] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.Seance_dbo.Therapie_TherapieId] FOREIGN KEY ([TherapieId]) REFERENCES [dbo].[Therapie] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_TherapieId]
    ON [dbo].[Seance]([TherapieId] ASC);

