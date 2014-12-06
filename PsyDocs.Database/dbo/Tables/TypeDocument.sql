CREATE TABLE [dbo].[TypeDocument] (
    [Id]          UNIQUEIDENTIFIER NOT NULL,
    [Nom]         NVARCHAR (50)    NOT NULL,
    [Description] NVARCHAR (255)   NOT NULL,
    CONSTRAINT [PK_dbo.TypeDocument] PRIMARY KEY CLUSTERED ([Id] ASC)
);

