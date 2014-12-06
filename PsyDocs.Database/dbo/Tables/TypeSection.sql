CREATE TABLE [dbo].[TypeSection] (
    [Id]          UNIQUEIDENTIFIER NOT NULL,
    [Nom]         NVARCHAR (50)    NOT NULL,
    [Description] NVARCHAR (255)   NOT NULL,
    CONSTRAINT [PK_dbo.TypeSection] PRIMARY KEY CLUSTERED ([Id] ASC)
);

