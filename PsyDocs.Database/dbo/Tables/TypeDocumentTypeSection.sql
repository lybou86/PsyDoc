CREATE TABLE [dbo].[TypeDocumentTypeSection] (
    [TypeDocumentId] UNIQUEIDENTIFIER NOT NULL,
    [TypeSectionId]  UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_TypeDocumentTypeSection] PRIMARY KEY CLUSTERED ([TypeDocumentId] ASC, [TypeSectionId] ASC),
    CONSTRAINT [FK_TypeDocumentTypeSection_TypeDocument] FOREIGN KEY ([TypeDocumentId]) REFERENCES [dbo].[TypeDocument] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_TypeDocumentTypeSection_TypeSection] FOREIGN KEY ([TypeSectionId]) REFERENCES [dbo].[TypeSection] ([Id]) ON DELETE CASCADE
);

