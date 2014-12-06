CREATE TABLE [dbo].[ModaliteTraitement] (
    [Id]  UNIQUEIDENTIFIER CONSTRAINT [DF_ModaliteTraitement_Id] DEFAULT (newid()) NOT NULL,
    [Nom] NVARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_ModaliteTraitement] PRIMARY KEY CLUSTERED ([Id] ASC)
);

