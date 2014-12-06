/*
Script de post-déploiement						
*/

SET NOCOUNT ON

-----------------------------------------------
-- Creation du compte administrateur de base --
-----------------------------------------------

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

-------------------------------------
-- Creation des types de documents --
-------------------------------------


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

-- Autre
IF NOT EXISTS(SELECT TOP 1 * from TypeDocument WHERE Nom = 'Autre') 
BEGIN
	INSERT INTO [dbo].[TypeDocument]
			([Id]
			,[Nom]
			,[Description])
		 VALUES
			(NEWID(),
			'Autre',
			'Autre type de document'
			)	
END

-----------------------------------
-- Création des type de sections -- 
-----------------------------------

-- Autre
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Autre') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Autre',
		'Autre type de section'
		)	
END

-- Note
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Note') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Note',
		'Note temporaire'
		)	
END

-- Recommandations
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Recommandations') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Recommandations',
		'Recommandations'
		)	
END

-- Résumé des interventions
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Résumé des interventions') 

BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Résumé des interventions',
		'Résumé des interventions lors de la rencontre'
		)	
END

-- Résumé des thèmes abordés
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Résumé des thèmes abordés') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Résumé des thèmes abordés',
		'Résumé des Résumé des thèmes abordés lors de la rencontre'
		)	
END

-- Évolution du client
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Évolution du client') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Évolution du client',
		'Description de l évolution du client'
		)	
END

-- Interprétations professionnelles
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Interprétations professionnelles') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Interprétations professionnelles',
		'Interprétations professionnelles concernant le patient'
		)	
END

-- Motif de consultation
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Motif de consultation') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Motif de consultation',
		'Description des motif de consultation'
		)	
END

-- Méthodologie utilisée
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Méthodologie utilisée') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Méthodologie utilisée',
		'Résuméde la méthodologie utilisée dans le cadre de la thérapie'
		)	
END

-- Observations
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Observations') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Observations',
		'Observation concernant la thérapie'
		)	
END

-- Plan d’intervention
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Plan d’intervention') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Plan d’intervention',
		'Description du plan d’intervention'
		)	
END

-- Conclusions
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Conclusions') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Conclusions',
		'Conclusions sur la thérapie'
		 )	
END

-- Rythme et durée des rencontres
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Rythme et durée des rencontres') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Rythme et durée des rencontres',
		'Résumé du rythme et durée des rencontres '
		)	
END

-- Cheminement du client
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Cheminement du client') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Cheminement du client',
		'Observation concernant le cheminement du client'
		)	
END

-- Évaluation des services
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Évaluation des services') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Évaluation des services',
		'Évaluation des services rendus'
		)	
END

-- Motif de la cessation
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Motif de la cessation') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Motif de la cessation',
		'Description des motifs de la cessation des services'
		)	
END

-- État du client
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'État du client') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'État du client',
		'Résumé de l’état du client'
		)	
END

-- Historique familiale
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Historique familiale') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Historique familiale',
		'Description de l’historique familiale du client'
		)	
END

-- Historique conjugale
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Historique conjugale') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])
	VALUES
		(NEWID(),
		'Historique conjugale',
		'Description de l’historique conjugale du client'
		)	
END

-- Historique de travail
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Historique de travail') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])			
   VALUES
		(NEWID(),
		'Historique de travail',
		'Description de l’historique de travail du client'
		)	
END

-- Historique médicale
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Historique médicale') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])	
    VALUES
		(NEWID(),
		'Historique médicale',
		'Description de l’historique médicale du client'
		)	
END

-- Conclusion de l’examen psychologique
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Conclusion de l’examen psychologique') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])	
    VALUES
		(NEWID(),
		'Conclusion de l’examen psychologique',
		'Conclusion de l’examen psychologique du client'
		)	
END

-- Rencontres prévues
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Rencontres prévues') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])	
    VALUES
		(NEWID(),
		'Rencontres prévues',
		'Description des rencontres prévues'
		)	
END

-- Suivie
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Suivie') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])		
    VALUES
		(NEWID(),
		'Suivie',
		'Description du suivie proposé'
		)	
END

-- Description de la demande
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Description de la demande') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])		
    VALUES
		(NEWID(),
		'Description de la demande',
		'Description de la demande de transmission'
		)	
END

-- Description de la transmission
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Description de la transmission') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])		
    VALUES
		(NEWID(),
		'Description de la transmission',
		'Description de la transmission effectuée'
		)	
END

-- Motif de refus
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Motif de refus') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])		
    VALUES
		(NEWID(),
		'Motif de refus',
		'Description des motifs de refus'
		)	
END

-- Description de la rectification
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Description de la rectification') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])		
    VALUES
		(NEWID(),
		'Description de la rectification',
		'Description de la rectification'
		)	
END

-- Type d’autorisation
IF NOT EXISTS(SELECT TOP 1 * from TypeSection WHERE Nom = 'Type d’autorisation') 
BEGIN
	INSERT INTO [dbo].[TypeSection]
		([Id]
		,[Nom]
		,[Description])		
	VALUES
		(NEWID(),
		'Type d’autorisation',
		'Description du type d’autorisation'
		)	
END

-----------------------------------------------------------
--Créer table de jointure des Id TypeDocumentTypeSection -- 
-----------------------------------------------------------

INSERT INTO TypeDocumentTypeSection (TypeDocumentId, TypeSectionId) 
	SELECT TD.Id, TS.Id
	FROM TypeDocument AS TD, TypeSection AS TS
	WHERE 
   (
   TD.Nom = 'Note d’évolution'				AND (TS.Nom = 'Autre'
											OR TS.Nom = 'Recommandations'
											OR TS.Nom = 'Résumé des interventions'
											OR TS.Nom = 'Résumé des thèmes abordés'
											OR TS.Nom = 'Évolution du client'
											OR TS.Nom = 'Interprétations professionnelles'
											OR TS.Nom = 'Note')
	OR
	TD.Nom = 'Rapport d’évaluation'			AND (TS.Nom = 'Autre'
											OR TS.Nom = 'Recommandations'
											OR TS.Nom = 'Note'
											OR TS.Nom = 'Motif de consultation'
											OR TS.Nom = 'Méthodologie utilisée'
											OR TS.Nom = 'Plan d’intervention'
											OR TS.Nom = 'Observations'
											OR TS.Nom = 'Conclusions')
	 OR
	 TD.Nom = 'Rapport final'				AND (TS.Nom = 'Autre'
											OR TS.Nom = 'Recommandations'
											OR TS.Nom = 'Note'
											OR TS.Nom = 'Motif de consultation'
											OR TS.Nom = 'Plan d’intervention'
											OR TS.Nom = 'Rythme et durée des rencontres'
											OR TS.Nom = 'Cheminement du client'
											OR TS.Nom = 'Évaluation des services'
											OR TS.Nom = 'Motif de la cessation'
	 										OR TS.Nom = 'État du client')

	 OR
	 TD.Nom = 'Information générale'		AND (TS.Nom = 'Autre'
											OR TS.Nom = 'Note' 
											OR TS.Nom = 'Historique familiale'
											OR TS.Nom = 'Historique conjugale'
											OR TS.Nom = 'Historique de travail'
											OR TS.Nom = 'Historique médicale')
	 OR
	 TD.Nom = 'Information sur la thérapie'	AND (TS.Nom = 'Autre'
											OR TS.Nom = 'Note'
											OR TS.Nom = 'Recommandations'
											OR TS.Nom = 'Conclusion de l’examen psychologique'
											OR TS.Nom = 'Rencontres prévues'
											OR TS.Nom = 'Suivie'
											OR TS.Nom = 'Méthodologie utilisée'
											OR TS.Nom = 'Plan d’intervention')
	OR
	 TD.Nom = 'Demande de transmission'		AND (TS.Nom = 'Autre'
											OR TS.Nom = 'Note'
											OR TS.Nom = 'Description de la demande'
											OR TS.Nom = 'Description de la transmission' 
											OR TS.Nom = 'Motif de refus')
	OR
	 TD.Nom = 'Demande de rectification'	AND (TS.Nom = 'Autre'
											OR TS.Nom = 'Note'
											OR TS.Nom = 'Description de la demande'
											OR TS.Nom = 'Description de la rectification'
											OR TS.Nom = 'Motif de refus')
	OR
	 TD.Nom = 'Demande d’autorisation'		AND (TS.Nom = 'Autre'
											OR TS.Nom = 'Note'
											OR TS.Nom = 'Description de la demande'
											OR TS.Nom = 'Type d’autorisation')
	OR
	 TD.Nom = 'Notes temporaires'			AND (TS.Nom = 'Autre'
											OR TS.Nom = 'Note')
	OR
	 TD.Nom = 'Autre'						AND (TS.Nom = 'Autre')
	) 					 							     
   AND 
   (
   NOT EXISTS
               (SELECT TypeDocumentId, TypeSectionId
                FROM   TypeDocumentTypeSection as TDTS
                WHERE  TDTS.TypeDocumentId = TypeDocumentId AND TDTS.TypeSectionId = TypeSectionId)
   )

--------------------------------------------
-- Insertion des Modalités de traitements --
--------------------------------------------

IF NOT EXISTS(SELECT TOP 1 * from ModaliteTraitement WHERE Nom = 'Individuelle') 
BEGIN
	INSERT INTO [dbo].[ModaliteTraitement]
           ([Id]
           ,[Nom])
     VALUES (NEWID(),
	         'Individuelle')
           
END

IF NOT EXISTS(SELECT TOP 1 * from ModaliteTraitement WHERE Nom = 'Couple') 
BEGIN
	INSERT INTO [dbo].[ModaliteTraitement]
           ([Id]
           ,[Nom])
     VALUES (NEWID(),
	         'Couple')
           
END

IF NOT EXISTS(SELECT TOP 1 * from ModaliteTraitement WHERE Nom = 'Groupe') 
BEGIN
	INSERT INTO [dbo].[ModaliteTraitement]
           ([Id]
           ,[Nom])
     VALUES (NEWID(),
	         'Groupe')
           
END

IF NOT EXISTS(SELECT TOP 1 * from ModaliteTraitement WHERE Nom = 'Famille') 
BEGIN
	INSERT INTO [dbo].[ModaliteTraitement]
           ([Id]
           ,[Nom])
     VALUES (NEWID(),
	         'Famille')
           
END