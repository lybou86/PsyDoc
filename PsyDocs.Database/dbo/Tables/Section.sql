CREATE TABLE [dbo].[Section] (
    [Id]            UNIQUEIDENTIFIER NOT NULL,
    [DocumentId]    UNIQUEIDENTIFIER NOT NULL,
    [TypeSectionId] UNIQUEIDENTIFIER NOT NULL,
    [Contenu]       NVARCHAR (MAX)   NULL,
    [Position]      INT              NOT NULL,
    CONSTRAINT [PK_dbo.Section] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.Section_dbo.Document_DocumentId] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Document] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.Section_dbo.TypeSection_TypeSectionId] FOREIGN KEY ([TypeSectionId]) REFERENCES [dbo].[TypeSection] ([Id]) ON DELETE CASCADE
);


GO

CREATE NONCLUSTERED INDEX [IX_DocumentId]
    ON [dbo].[Section]([DocumentId] ASC);

GO
CREATE NONCLUSTERED INDEX [IX_TypeSectionId]
    ON [dbo].[Section]([TypeSectionId] ASC);

