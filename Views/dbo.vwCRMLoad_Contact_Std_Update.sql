SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vwCRMLoad_Contact_Std_Update] AS
--updateme - Hashes
SELECT 
a.new_ssbcrmsystemacctid									  
, a.new_ssbcrmsystemcontactid								  
, a.Prefix													 --,b.Salutation
, a.FirstName												 --,b.FirstName
, a.LastName												 --,b.LastName
, a.Suffix													 --,b.Suffix
, a.address1_line1											 --,b.address1_line1
, a.address1_city											 --,b.address1_city
, a.address1_stateorprovince								 --,b.address1_stateorprovince
, a.address1_postalcode										 --,b.address1_postalcode
, a.address1_country										 --,b.address1_country
, a.telephone1												 --,b.telephone1
, a.emailaddress1											 --,b.emailaddress1
, a.contactid												  
, LoadType	

--, case when  ISNULL(a.Prefix,'') != ISNULL(b.salutation,'')										  THEN 1 ELSE 0 END AS salutation	
--, case when  ISNULL(a.FirstName,'') != ISNULL(b.firstname,'')										   then 1 else 0 end as FirstName	
--, case when  ISNULL(a.lastname,'') != ISNULL(b.lastname,'')										  then 1 else 0 end as LastName		
--, case when  ISNULL(a.Suffix,'') != ISNULL(b.suffix,'')											  	then 1 else 0 end as Suffix		
--, case when  ISNULL(a.address1_line1,'') != ISNULL(b.address1_line1,'')							   then 1 else 0 end as address1_line1
--,case when	 ISNULL(a.address1_city,'') != ISNULL(b.address1_city,'')								   then 1 else 0 end as telephone1
--,case when	 ISNULL(a.address1_stateorprovince,'') != ISNULL(b.address1_stateorprovince,'')		   then 1 else 0 end as address1_stateorprovince
--,case when	 ISNULL(a.address1_postalcode,'') != ISNULL(b.address1_postalcode,'')					   then 1 else 0 end as address1_postalcode
--,case when	 ISNULL(a.address1_country,'') != ISNULL(b.address1_country,'')						   then 1 else 0 end as address1_country
--,case when	 ISNULL(a.telephone1,'') != ISNULL(b.telephone1,'')									   then 1 else 0 end as telephone1


FROM [dbo].[vwCRMLoad_Contact_Std_Prep] a
JOIN prodcopy.vw_contact b ON a.contactid = b.contactID
LEFT JOIN dbo.vw_KeyAccounts k ON k.ssbid = a.new_ssbcrmsystemcontactid
WHERE LoadType = 'Update'
AND k.ssbid IS null
--AND (
--a.Hash_FirstName !=  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Lower(b.FirstName))),'')) 
--OR a.Hash_lastname !=  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Lower(b.lastname))),'')) 
--OR a.Hash_suffix !=  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Lower(b.suffix))),'')) 
--OR a.Hash_Address1_Line1 !=  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Lower(b.address1_line1))),'')) 
--OR a.Hash_Telephone1 !=  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(LOWER(REPLACE(REPLACE(REPLACE(REPLACE(b.telephone1,')',''),'(',''),'-',''),' ','')))),''))
--OR a.Hash_EmailAddress1 !=  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Lower(b.emailaddress1))),'')) 
--)
AND (1=2

OR ISNULL(a.Prefix,'') != ISNULL(b.salutation,'')
OR ISNULL(a.FirstName,'') != ISNULL(b.firstname,'')
OR ISNULL(a.lastname,'') != ISNULL(b.lastname,'')
OR ISNULL(a.Suffix,'') != ISNULL(b.suffix,'')
OR ISNULL(a.address1_line1,'') != ISNULL(b.address1_line1,'')
OR ISNULL(a.address1_city,'') != ISNULL(b.address1_city,'')
OR ISNULL(a.address1_stateorprovince,'') != ISNULL(b.address1_stateorprovince,'')
OR ISNULL(a.address1_postalcode,'') != ISNULL(b.address1_postalcode,'')
--OR ISNULL(a.address1_country,'') != ISNULL(b.address1_country,'')
OR ISNULL(a.telephone1,'') != ISNULL(b.telephone1,'')
)

GO
