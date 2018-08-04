SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[vwCRMLoad_Contact_Custom_Update]
AS

SELECT  z.[crm_id] contactid
, b.new_ssbcrmsystemssidwinner																													-- ,c.new_ssbcrmsystemssidwinner
,b.new_ssbSSIDWinnerSourceSystem																												-- ,c.new_ssbssidwinnersourcesystem
--, TM_Ids [new_ssbcrmsystemarchticsids]																										--
, DimCustIDs new_ssbcrmsystemdimcustomerids																										-- ,c.new_ssbcrmsystemdimcustomerids
--, b.AccountId str_number																														-- ,c.[new_ssbcrmsystemarchticsids]
, b.AccountId [str_number]																														-- ,c.str_number										--updateme for STR clients
, z.EmailPrimary AS emailaddress1																												-- ,c.emailaddress1
, b.str_category																																-- ,c.str_category
, b.str_clienttenure																															-- ,c.str_clienttenure	
, ISNULL(NULLIF(b.mobilephone,''),c.mobilephone)	mobilephone																				    -- ,c.mobilephone	
, ISNULL(NULLIF(b.telephone2,''),c.telephone2)	telephone2																						-- ,c.telephone2
, ISNULL(b.str_externalprioritymodel, c.str_externalprioritymodel) str_externalprioritymodel													-- ,c.str_externalprioritymodel
, b.new_groupbuyer																																-- ,c.new_groupbuyer	
, b.new_singlegamebuyer																															-- ,c.new_singlegamebuyer
--, b.new_emailunsubscribe																														-- ,c.new_emailunsubscribe	
, b.new_lastpurchasedate																														-- ,c.new_lastpurchasedate
, b.new_numofgamessoldonsecondary																												-- ,c.new_numofgamessoldonsecondary
, b.[new_broker]																																-- ,c.[new_broker]

	--, case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_ssbcrmsystemssidwinner)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemssidwinner AS VARCHAR(MAX)))),'')) 					 then 1 else 0 end as new_ssbcrmsystemssidwinner
	--, case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.[new_ssbSSIDWinnerSourceSystem])),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbssidwinnersourcesystem AS VARCHAR(MAX)))),'')) 					 then 1 else 0 end as new_ssbssidwinnersourcesystem
 -- --, case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.DimCustIDs)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemdimcustomerids AS VARCHAR(MAX)))),'')) 					 then 1 else 0 end as new_ssbcrmsystemdimcustomerids
	--, case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.AccountId)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_number AS VARCHAR(MAX)))),''))					 then 1 else 0 end as str_number
	--, case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.str_category)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_category AS NVARCHAR(MAX)))),''))					 then 1 else 0 end as str_category
	--, case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.str_clienttenure)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clienttenure AS NVARCHAR(MAX)))),''))					 then 1 else 0 end as str_clienttenure
	--, case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(nullif(b.mobilephone,''))),c.mobilephone) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.mobilephone AS NVARCHAR(MAX)))),''))					 then 1 else 0 end as mobilephone
	--, case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(nullif(b.telephone2,''))),c.telephone2) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.telephone2 AS NVARCHAR(MAX)))),''))						 then 1 else 0 end as telephone2
	--, case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.str_externalprioritymodel)),c.str_externalprioritymodel) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_externalprioritymodel AS NVARCHAR(MAX)))),''))					 then 1 else 0 end as str_externalprioritymodel
	--, case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_groupbuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_groupbuyer AS NVARCHAR(MAX)))),''))					 then 1 else 0 end as new_groupbuyer
	--, case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_singlegamebuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_singlegamebuyer AS NVARCHAR(MAX)))),''))					 then 1 else 0 end as new_singlegamebuyer
 -- --, case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_emailunsubscribe)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_emailunsubscribe AS BIT))),''))				 then 1 else 0 end as new_emailunsubscribe
	--, case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(b.new_lastpurchasedate AS DATE))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_lastpurchasedate AS DATE))),''))					 then 1 else 0 end as new_lastpurchasedate
	--, case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_numofgamessoldonsecondary)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_numofgamessoldonsecondary AS INT))),''))					 THEN 1 else 0 end as new_numofgamessoldonsecondary
	--, case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.[new_broker])),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.[new_broker] AS BIT))),''))					 then 1 else 0 end as [new_broker]

-- SELECT *
-- SELECT COUNT(*) 
FROM dbo.[Contact_Custom] b 
INNER JOIN dbo.Contact z ON b.SSB_CRMSYSTEM_CONTACT_ID = z.[SSB_CRMSYSTEM_CONTACT_ID]
LEFT JOIN  prodcopy.vw_contact c ON z.[crm_id] = c.contactID
--INNER JOIN dbo.CRMLoad_Contact_ProcessLoad_Criteria pl ON b.SSB_CRMSYSTEM_CONTACT_ID = pl.SSB_CRMSYSTEM_CONTACT_ID
LEFT JOIN dbo.vw_KeyAccounts k ON k.ssbid = z.SSB_CRMSYSTEM_CONTACT_ID
WHERE z.[SSB_CRMSYSTEM_CONTACT_ID] <> z.[crm_id]
AND k.ssbid IS NULL
AND  (1=2
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_ssbcrmsystemssidwinner)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemssidwinner AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.[new_ssbSSIDWinnerSourceSystem])),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbssidwinnersourcesystem AS VARCHAR(MAX)))),'')) 
  --OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.DimCustIDs)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemdimcustomerids AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.AccountId)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_number AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.str_category)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_category AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.str_clienttenure)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clienttenure AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(nullif(b.mobilephone,''))),c.mobilephone) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.mobilephone AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(nullif(b.telephone2,''))),c.telephone2) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.telephone2 AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.str_externalprioritymodel)),c.str_externalprioritymodel) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_externalprioritymodel AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_groupbuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_groupbuyer AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_singlegamebuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_singlegamebuyer AS NVARCHAR(MAX)))),''))
  --OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_emailunsubscribe)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_emailunsubscribe AS BIT))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(b.new_lastpurchasedate AS DATE))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_lastpurchasedate AS DATE))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_numofgamessoldonsecondary)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_numofgamessoldonsecondary AS INT))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.[new_broker])),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.[new_broker] AS BIT))),''))
--updateme only for STR clients--	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.AccountId)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.[str_number] AS VARCHAR(MAX)))),''))

	)
	


GO
