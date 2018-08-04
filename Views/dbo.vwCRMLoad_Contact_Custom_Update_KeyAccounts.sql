SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[vwCRMLoad_Contact_Custom_Update_KeyAccounts]
AS

SELECT  z.[crm_id] contactid
, b.new_ssbcrmsystemssidwinner								 --,c.new_ssbcrmsystemssidwinner
,b.new_ssbSSIDWinnerSourceSystem							 --,c.new_ssbssidwinnersourcesystem
, DimCustIDs new_ssbcrmsystemdimcustomerids					 --,c.new_ssbcrmsystemdimcustomerids
, b.AccountId [str_number]									 --,c.str_number										--updateme for STR clients

 --, case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_ssbcrmsystemssidwinner)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemssidwinner AS VARCHAR(MAX)))),'')) 			   then 1 else 0 end as new_ssbcrmsystemssidwinner
 --, case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.[new_ssbSSIDWinnerSourceSystem])),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbssidwinnersourcesystem AS VARCHAR(MAX)))),'')) 	   then 1 else 0 end as new_ssbssidwinnersourcesystem
 --, case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.DimCustIDs)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemdimcustomerids AS VARCHAR(MAX)))),'')) 						   then 1 else 0 end as new_ssbcrmsystemdimcustomerids
 --, case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.AccountId)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_number AS VARCHAR(MAX)))),''))												   then 1 else 0 end as str_number
																																																			  

-- SELECT *
-- SELECT COUNT(*) 
FROM dbo.[Contact_Custom] b 
INNER JOIN dbo.Contact z ON b.SSB_CRMSYSTEM_CONTACT_ID = z.[SSB_CRMSYSTEM_CONTACT_ID]
LEFT JOIN  prodcopy.vw_contact c ON z.[crm_id] = c.contactID
--INNER JOIN dbo.CRMLoad_Contact_ProcessLoad_Criteria pl ON b.SSB_CRMSYSTEM_CONTACT_ID = pl.SSB_CRMSYSTEM_CONTACT_ID
LEFT JOIN dbo.vw_KeyAccounts k ON k.ssbid = z.SSB_CRMSYSTEM_CONTACT_ID
WHERE z.[SSB_CRMSYSTEM_CONTACT_ID] <> z.[crm_id]
AND k.ssbid IS NOT NULL
AND  (1=2
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_ssbcrmsystemssidwinner)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemssidwinner AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.[new_ssbSSIDWinnerSourceSystem])),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbssidwinnersourcesystem AS VARCHAR(MAX)))),'')) 
	--OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.DimCustIDs)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemdimcustomerids AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.AccountId)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_number AS VARCHAR(MAX)))),''))

	)
	


GO
