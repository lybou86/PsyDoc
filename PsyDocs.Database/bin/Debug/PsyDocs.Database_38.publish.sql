﻿/*
Deployment script for Psydocs

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Psydocs"
:setvar DefaultFilePrefix "Psydocs"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
Script de post-déploiement						
*/

SET NOCOUNT ON

-- Creation du compte administrateur de base

IF NOT EXISTS(SELECT TOP 1 * from Utilisateur WHERE Courriel = 'administrateur@psydocs.ca') 
BEGIN
	INSERT INTO [dbo].[Utilisateur]
           ([Id]
           ,[Nom]
           ,[Prenom]
           ,[NumeroTelephone]
           ,[Courriel]
           ,[MotDePasse]
           ,[EstAdministrateur])
     VALUES (NEWID(),
	         'PsyDocs',
			 'Administrateur',
			 '5145555555',
			 'administrateur@psydocs.ca',
			 '50D3C2A5902424C6E42EC06AA3CE84AD', -- Le mot de passe "psydocs" en MD5 Hash
			 1)
           
END

-- Creation des types de documents

IF NOT EXISTS(SELECT TOP 1 * from TypeDocument WHERE Nom = 'Note d’évolution') 
INSERT INTO [dbo].[TypeDocument]
           ([Id]
           ,[Nom]
           ,[Description])
     VALUES
           (NEWID(),
           'Note d’évolution',
		   'Rapport d’évolution du client'
           )
GO




--DELETE FROM [dbo].[Utilisateur]
--GO
GO

GO
PRINT N'Update complete.';


GO
