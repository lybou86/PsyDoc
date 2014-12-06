CREATE TABLE [dbo].[Document] (
    [Id]            UNIQUEIDENTIFIER NOT NULL,
    [Titre]         NVARCHAR (100)   NOT NULL,
    [Description]   NVARCHAR (255)   NOT NULL,
    [Chemin]        NVARCHAR (260)   NULL,
    [TypeMime]      NVARCHAR (50)    NULL,
    [Discriminator] NVARCHAR (128)   CONSTRAINT [DF_Document_Discriminator] DEFAULT (N'Interne') NOT NULL,
    CONSTRAINT [PK_dbo.Document] PRIMARY KEY CLUSTERED ([Id] ASC)
);

