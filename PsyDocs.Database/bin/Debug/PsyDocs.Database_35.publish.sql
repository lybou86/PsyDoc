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

DELETE FROM [dbo].[Utilisateur]
GO

if not exists(select top 1 * from Utilisateur where courriel = 'a@psydocs.ca') 
begin
	insert into [dbo].[Utilisateur]
           ([id]
           ,[nom]
           ,[prenom]
           ,[numerotelephone]
           ,[courriel]
           ,[motdepasse]
           ,[estadministrateur])

     values (newid(),
	         'A',
			 'A',
			 '5145555555',
			 'administrateur@psydocs.ca',
			 '50d3c2a5902424c6e42ec06aa3ce84ad', -- le mot de passe "psydocs" en md5 hash
			 1)  
end

GO

GO
PRINT N'Update complete.';


GO
