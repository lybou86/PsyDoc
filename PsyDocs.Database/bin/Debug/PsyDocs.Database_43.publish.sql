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

--Note d’évolution
IF NOT EXISTS(SELECT TOP 1 * from TypeDocument WHERE Nom = 'Note d’évolution') 
BEGIN
	INSERT INTO [dbo].[TypeDocument]
			([Id]
			,[Nom]
			,[Description])
		 VALUES
			(NEWID(),
			'Note d’évolution',
			'Note sur l’évolution du client'
			)			
END

--Rapport d’évaluation
IF NOT EXISTS(SELECT TOP 1 * from TypeDocument WHERE Nom = 'Rapport d’évaluation') 
BEGIN
	INSERT INTO [dbo].[TypeDocument]
			([Id]
			,[Nom]
			,[Description])
		 VALUES
			(NEWID(),
			'Rapport d’évaluation',
			'Rapport d’évolution du client'
			)	
END

--Rapport final
IF NOT EXISTS(SELECT TOP 1 * from TypeDocument WHERE Nom = 'Rapport final') 
BEGIN
	INSERT INTO [dbo].[TypeDocument]
			([Id]
			,[Nom]
			,[Description])
		 VALUES
			(NEWID(),
			'Rapport final',
			'Rapport final à la fermeture du dossier'
			)	
END

--Information générale
IF NOT EXISTS(SELECT TOP 1 * from TypeDocument WHERE Nom = 'Information générale') 
BEGIN
	INSERT INTO [dbo].[TypeDocument]
			([Id]
			,[Nom]
			,[Description])
		 VALUES
			(NEWID(),
			'Information générale',
			'Information générale concernant le client'
			)	
END

--Motif de consultation
IF NOT EXISTS(SELECT TOP 1 * from TypeDocument WHERE Nom = 'Motif de consultation') 
BEGIN
	INSERT INTO [dbo].[TypeDocument]
			([Id]
			,[Nom]
			,[Description])
		 VALUES
			(NEWID(),
			'Motif de consultation',
			'Motifs de la consultation du client'
			)	
END

--Information sur la thérapie
IF NOT EXISTS(SELECT TOP 1 * from TypeDocument WHERE Nom = 'Information sur la thérapie') 
BEGIN
	INSERT INTO [dbo].[TypeDocument]
			([Id]
			,[Nom]
			,[Description])
		 VALUES
			(NEWID(),
			'Information sur la thérapie',
			'Description de la thérapie'
			)	
END

--Demande de transmission
IF NOT EXISTS(SELECT TOP 1 * from TypeDocument WHERE Nom = 'Demande de transmission') 
BEGIN
	INSERT INTO [dbo].[TypeDocument]
			([Id]
			,[Nom]
			,[Description])
		 VALUES
			(NEWID(),
			'Demande de transmission',
			'Demande de transmission de renseignements'
			)	
END

--Demande de rectification
IF NOT EXISTS(SELECT TOP 1 * from TypeDocument WHERE Nom = 'Demande de rectification') 
BEGIN
	INSERT INTO [dbo].[TypeDocument]
			([Id]
			,[Nom]
			,[Description])
		 VALUES
			(NEWID(),
			'Demande de rectification',
			'Demande de rectification d’information au dossier'
			)	
END

--Demande d’autorisation
IF NOT EXISTS(SELECT TOP 1 * from TypeDocument WHERE Nom = 'Demande d’autorisation') 
BEGIN
	INSERT INTO [dbo].[TypeDocument]
			([Id]
			,[Nom]
			,[Description])
		 VALUES
			(NEWID(),
			'Demande d’autorisation',
			'Demande d’autorisation'
			)	
END

-- Notes temporaires
IF NOT EXISTS(SELECT TOP 1 * from TypeDocument WHERE Nom = 'Notes temporaires') 
BEGIN
	INSERT INTO [dbo].[TypeDocument]
			([Id]
			,[Nom]
			,[Description])
		 VALUES
			(NEWID(),
			'Notes temporaires',
			'Notes temporaires'
			)	
END

GO

--DELETE FROM [dbo].[Utilisateur]
--GO
GO

GO
PRINT N'Update complete.';


GO
