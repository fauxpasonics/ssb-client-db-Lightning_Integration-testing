SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE PROCEDURE [wrk].[sp_Contact_Custom]
AS 

MERGE INTO dbo.Contact_Custom Target
USING dbo.Contact source
ON source.[SSB_CRMSYSTEM_CONTACT_ID] = target.[SSB_CRMSYSTEM_CONTACT_ID]
WHEN NOT MATCHED BY TARGET THEN
INSERT ([SSB_CRMSYSTEM_ACCT_ID], [SSB_CRMSYSTEM_CONTACT_ID]) VALUES (source.[SSB_CRMSYSTEM_ACCT_ID], Source.[SSB_CRMSYSTEM_CONTACT_ID])
WHEN NOT MATCHED BY SOURCE THEN
DELETE ;

EXEC dbo.sp_CRMProcess_ConcatIDs 'Contact'


--UPDATE a
--SET SeasonTicket_Years = recent.SeasonTicket_Years
----SELECT *
--FROM dbo.[Contact_Custom] a
--INNER JOIN dbo.CRMProcess_DistinctContacts recent ON [recent].[SSB_CRMSYSTEM_CONTACT_ID] = [a].[SSB_CRMSYSTEM_CONTACT_ID]

UPDATE a
SET a.new_ssbcrmsystemssidwinner = b.[SSID], a.new_ssbSSIDWinnerSourceSystem = b.SourceSystem
FROM [dbo].Contact_Custom a
INNER JOIN dbo.[vwCompositeRecord_ModAcctID] b ON b.[SSB_CRMSYSTEM_CONTACT_ID] = [a].[SSB_CRMSYSTEM_CONTACT_ID]

/*STM/Partial Flags*/

 SELECT DISTINCT ssbid.SSB_CRMSYSTEM_CONTACT_ID GUID, CASE
 when dp.plancode like 'L15%' and fts.TM_ticket_type = 'Complimentary' then 'L15 Lightning Comp'
 when dp.plancode like 'L15%' and fts.TM_ticket_type = 'Trade Account' then 'L15 Lightning Trade'
 when dp.plancode like 'L15%' and fts.TM_ticket_type = 'Sponsorship Account' then 'L15 Lightning Partner'
 when dp.plancode = 'L15' OR dp.plancode like 'L15-%' then 'L15 Lightning Full' 
 when dp.plancode like 'L15HA%' then 'L15 Lightning Half A' 
 when dp.plancode like 'L15HB%' then 'L15 Lightning Half B' 
 when dp.plancode like 'L15TA%' then 'L15 Lightning 10 Game A' 
 when dp.plancode like 'L15TB%' then 'L15 Lightning 10 Game B' 
 when dp.plancode like 'L15TC%' then 'L15 Lightning 10 Game C' 
 when dp.plancode like 'L15TD%' then 'L15 Lightning 10 Game D' 
 when dp.plancode like 'L15S%' then 'L15 Lightning Suite' 
 when dp.plancode = 'L15BIB' then 'L15 Lightning Back in Black'
 when fts.TM_ticket_type like 'Flex%' and ds.SeasonName like '%2015%' and ds.SeasonName like '%lightning%'  then 'L15 Lightning Flex'
 when dp.plancode like 'S16%' and fts.TM_ticket_type = 'Complimentary' then 'S16 Storm Comp'
 when dp.plancode like 'S16%' and fts.TM_ticket_type = 'Trade Account' then 'S16 Storm Trade'
 when dp.plancode like 'S16%' and fts.TM_ticket_type = 'Sponsorship Account' then 'S16 Storm Partner'
 when dp.plancode like 'S16S%' then 'S16 Storm Suite'
 when dp.plancode like 'S16%' then 'S16 Storm STM'
 when dp.plancode like 'L16%' and fts.TM_ticket_type = 'Complimentary' then 'L16 Lightning Comp'
 when dp.plancode like 'L16%' and fts.TM_ticket_type = 'Trade Account' then 'L16 Lightning Trade'
 when dp.plancode like 'L16%' and fts.TM_ticket_type = 'Sponsorship Account' then 'L16 Lightning Partner'
 when dp.plancode = 'L16' or dp.plancode like 'L16-%' then 'L16 Lightning Full' 
 when dp.plancode like 'L16HA%' then 'L16 Lightning Half A' 
 when dp.plancode like 'L16HB%' then 'L16 Lightning Half B' 
 when dp.plancode like 'L16TA%' then 'L16 Lightning 10 Game A' 
 when dp.plancode like 'L16TB%' then 'L16 Lightning 10 Game B' 
 when dp.plancode like 'L16TC%' then 'L16 Lightning 10 Game C' 
 when dp.plancode like 'L16TD%' then 'L16 Lightning 10 Game D' 
 when dp.plancode like 'L16S%' then 'L16 Lightning Suite' 
 when dp.plancode = 'L16BIB' then 'L16 Lightning Back in Black'
 when (fts.TM_ticket_type = 'Flex Pack A' or fts.TM_ticket_type = 'Flex Pack B') and ds.SeasonName like '%lightning%' and ds.SeasonName like '%2016%' then 'L16 Lightning Flex'
 when (fts.TM_ticket_type = 'Flex Pack A' or fts.TM_ticket_type = 'Flex Pack B') and ds.SeasonName like '%storm%' and ds.SeasonName like '%2017%' then 'S17 Storm Flex'
 when dp.plancode like 'S17%' and fts.TM_ticket_type = 'Complimentary' then 'S17 Storm Comp'
 when dp.plancode like 'S17%' and fts.TM_ticket_type = 'Trade Account' then 'S17 Storm Trade'
 when dp.plancode like 'S17%' and fts.TM_ticket_type = 'Sponsorship Account' then 'S17 Storm Partner'
 when dp.plancode like 'S17S%' then 'S17 Storm Suite'
 when dp.plancode like 'S17%' then 'S17 Storm STM'
 when dp.plancode like 'L17%' and fts.TM_ticket_type = 'Complimentary' then 'L17 Lightning Comp'
 when dp.plancode like 'L17%' and fts.TM_ticket_type = 'Trade Account' then 'L17 Lightning Trade'
 when dp.plancode like 'L17%' and fts.TM_ticket_type = 'Sponsorship Account' then 'L17 Lightning Partner'
 when dp.plancode = 'L17' or dp.plancode like 'L17-%' then 'L17 Lightning Full' 
 when dp.plancode like 'L17HA%' then 'L17 Lightning Half A' 
 when dp.plancode like 'L17HB%' then 'L17 Lightning Half B' 
 when dp.plancode like 'L17TA%' then 'L17 Lightning 10 Game A' 
 when dp.plancode like 'L17TB%' then 'L17 Lightning 10 Game B' 
 when dp.plancode like 'L17TC%' then 'L17 Lightning 10 Game C' 
 when dp.plancode like 'L17TD%' then 'L17 Lightning 10 Game D' 
 when dp.plancode like 'L17S%' then 'L17 Lightning Suite' 
 when dp.plancode = 'L17BIB' then 'L17 Lightning Back in Black'
 when (fts.TM_ticket_type = 'Flex Pack A' or fts.TM_ticket_type = 'Flex Pack B') and ds.SeasonName like '%lightning%' and ds.SeasonName like '%2017%' then 'L17 Lightning Flex'
 when dp.plancode like 'L18%' and fts.TM_ticket_type = 'Complimentary' then 'L18 Lightning Comp'
 when dp.plancode like 'L18%' and fts.TM_ticket_type = 'Trade Account' then 'L18 Lightning Trade'
 when dp.plancode like 'L18%' and fts.TM_ticket_type = 'Sponsorship Account' then 'L18 Lightning Partner'
 when dp.plancode = 'L18' or dp.plancode like 'L18-%' then 'L18 Lightning Full' 
 when dp.plancode like 'L18HA%' then 'L18 Lightning Half A' 
 when dp.plancode like 'L18HB%' then 'L18 Lightning Half B' 
 when dp.plancode like 'L18TA%' then 'L18 Lightning 10 Game A' 
 when dp.plancode like 'L18TB%' then 'L18 Lightning 10 Game B' 
 when dp.plancode like 'L18TC%' then 'L18 Lightning 10 Game C' 
 when dp.plancode like 'L18TD%' then 'L18 Lightning 10 Game D' 
 when dp.plancode like 'L18S%' then 'L18 Lightning Suite' 
 when dp.plancode = 'L18BIB' then 'L18 Lightning Back in Black'
 when (fts.TM_ticket_type = 'Flex Pack A' or fts.TM_ticket_type = 'Flex Pack B') and ds.SeasonName like '%lightning%' and ds.SeasonName like '%2018%' then 'L18 Lightning Flex'
 ELSE NULL end STMTag
 INTO #STMCases
 FROM lightning.dbo.FactTicketSales_V2 fts (NOLOCK)
 JOIN lightning.dbo.DimPlan_V2 dp (NOLOCK) ON dp.DimPlanId = fts.DimPlanId
 JOIN lightning.dbo.DimSeason_V2 ds (NOLOCK) ON ds.DimSeasonId = fts.DimSeasonId
 JOIN lightning.dbo.DimTicketCustomer_V2 dtc (NOLOCK) ON dtc.DimTicketCustomerId = fts.DimTicketCustomerId
 JOIN lightning.dbo.vwDimCustomer_ModAcctId ssbid (NOLOCK) ON ssbid.AccountId=dtc.ETL__SSID_TM_acct_id AND ssbid.CustomerType='Primary' AND ssbid.SourceSystem = 'TM'
  WHERE ds.SeasonName NOT LIKE '%parking%'


 SELECT x1.Guid, ISNULL(LEFT(STUFF((SELECT ' ' + x2.STMTag + ' | '  AS [text()]
 FROM #STMCases x2
 WHERE x1.GUID=x2.GUID
 ORDER BY x2.GUID, x2.STMTag DESC
 FOR XML PATH ('')),1,1,''),8000),'') AS STMTags
 INTO #STMFields
 FROM #STMCases x1


 UPDATE a
 SET a.str_category = STMTags
 FROM [dbo].Contact_Custom a
 JOIN #STMFields b ON GUID=a.SSB_CRMSYSTEM_CONTACT_ID

 /*Group Buyers*/
SELECT DISTINCT ssbid.SSB_CRMSYSTEM_CONTACT_ID GUID, CASE
 WHEN ISNULL(dpc.PC2,'') = 'G' AND fts.TM_ticket_type LIKE '%group%' AND ds.SeasonName='2016-17 Lightning' THEN 'L16 Group'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND fts.TM_ticket_type LIKE '%group%' AND ds.SeasonName='2014-15 Lightning' THEN 'L14 Group'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND fts.TM_ticket_type LIKE '%group%' AND ds.SeasonName='2015-16 Lightning' THEN 'L15 Group'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND fts.TM_ticket_type LIKE '%group%' AND ds.SeasonName='2017-18 Lightning' THEN 'L17 Group'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND fts.TM_ticket_type LIKE '%group%' AND ds.SeasonName='2016-17 Lightning Suites' THEN 'L16 Group Suites'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND fts.TM_ticket_type LIKE '%group%' AND ds.SeasonName='2014-15 Lightning Suites' THEN 'L14 Group Suites'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND fts.TM_ticket_type LIKE '%group%' AND ds.SeasonName='2015-16 Lightning Suites' THEN 'L15 Group Suites'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND fts.TM_ticket_type LIKE '%group%' AND ds.SeasonName='2017-18 Lightning Suites' THEN 'L17 Group Suites'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND ds.SeasonName='2016-17 Event - Royalty' THEN 'E16 Event Group'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND ds.SeasonName='2018-19 Event - Royalty' THEN 'E18 Event Group'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND ds.SeasonName='2015-16 Event - Royalty' THEN 'E15 Event Group'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND ds.SeasonName='2017-18 Event - Royalty' THEN 'E17 Event Group'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND ds.SeasonName='2016-17 Event - Suites' THEN 'E16 Event Group Suites'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND ds.SeasonName='2014-15 Event - Suites' THEN 'E14 Event Group Suites'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND ds.SeasonName='2015-16 Event - Suites' THEN 'E15 Event Group Suites'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND ds.SeasonName LIKE '2015-16 Event - Suites with Loge%' THEN 'E15 Event Group Loge Suites'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND ds.SeasonName='2017-18 Event - Suites' THEN 'E17 Event Group Suites'
 WHEN ISNULL(dpc.PC2,'') = 'G' AND ds.SeasonName='2018-19 Event - Suites' THEN 'E18 Event Group Suites'
 else NULL end GroupTag
 INTO #GroupCases
 FROM lightning.dbo.FactTicketSales_V2 fts (NOLOCK)
 JOIN lightning.dbo.DimPlan_V2 dp (NOLOCK) ON dp.DimPlanId = fts.DimPlanId
 JOIN lightning.dbo.DimSeason_V2 ds (NOLOCK) ON ds.DimSeasonId = fts.DimSeasonId
 JOIN lightning.dbo.DimTicketCustomer_V2 dtc (NOLOCK) ON dtc.DimTicketCustomerId = fts.DimTicketCustomerId
 JOIN lightning.dbo.vwDimCustomer_ModAcctId ssbid (NOLOCK) ON ssbid.AccountId=dtc.ETL__SSID_TM_acct_id AND ssbid.CustomerType='Primary' AND ssbid.SourceSystem = 'TM'
 JOIN lightning.dbo.DimPriceCode_V2 dpc (NOLOCK) ON dpc.DimPriceCodeId = fts.DimPriceCodeId
 LEFT JOIN lightning.dbo.DimTicketType_V2 dtt (NOLOCK) ON dtt.DimTicketTypeId = fts.DimTicketTypeId
 LEFT JOIN lightning.dbo.DimPlanType_V2 dpt (NOLOCK) ON dpt.DimPlanTypeId = fts.DimPlanTypeId 
  WHERE ds.SeasonName NOT LIKE '%parking%'
 AND dpc.PC2='G'

 SELECT x1.Guid, ISNULL(LEFT(STUFF((SELECT ' ' + x2.GroupTag + ' | '  AS [text()]
 FROM #GroupCases x2
 WHERE x1.GUID=x2.GUID
 ORDER BY x2.GUID, x2.GroupTag DESC
 FOR XML PATH ('')),1,1,''),8000),'') AS GroupTags
 INTO #GroupFields
 FROM #GroupCases x1

 UPDATE a
 SET a.new_groupbuyer = b.GroupTags
 FROM [dbo].Contact_Custom a
 JOIN #GroupFields b ON GUID=a.SSB_CRMSYSTEM_CONTACT_ID

 /*Single Game Buyers*/

SELECT DISTINCT ssbid.SSB_CRMSYSTEM_CONTACT_ID GUID, CASE
 WHEN ISNULL(dpc.PC2,'') != 'G' AND fts.TM_ticket_type NOT LIKE '%group%' AND dp.Plancode = 'None' AND ds.SeasonName='2016-17 Lightning' THEN 'L16 Single Game'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND fts.TM_ticket_type NOT LIKE '%group%' AND dp.Plancode = 'None' AND ds.SeasonName='2014-15 Lightning' THEN 'L14 Single Game'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND fts.TM_ticket_type NOT LIKE '%group%' AND dp.Plancode = 'None' AND ds.SeasonName='2015-16 Lightning' THEN 'L15 Single Game'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND fts.TM_ticket_type NOT LIKE '%group%' AND dp.Plancode = 'None' AND ds.SeasonName='2017-18 Lightning' THEN 'L17 Single Game'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND fts.TM_ticket_type NOT LIKE '%group%' AND dp.Plancode = 'None' AND ds.SeasonName='2016-17 Lightning Suites' THEN 'L16 Single Game Suites'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND fts.TM_ticket_type NOT LIKE '%group%' AND dp.Plancode = 'None' AND ds.SeasonName='2014-15 Lightning Suites' THEN 'L14 Single Game Suites'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND fts.TM_ticket_type NOT LIKE '%group%' AND dp.Plancode = 'None' AND ds.SeasonName='2015-16 Lightning Suites' THEN 'L15 Single Game Suites'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND fts.TM_ticket_type NOT LIKE '%group%' AND dp.Plancode = 'None' AND ds.SeasonName='2017-18 Lightning Suites' THEN 'L17 Single Game Suites'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND ds.SeasonName='2016-17 Event - Royalty' THEN 'E16 Event'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND ds.SeasonName='2018-19 Event - Royalty' THEN 'E18 Event'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND ds.SeasonName='2015-16 Event - Royalty' THEN 'E15 Event'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND ds.SeasonName='2017-18 Event - Royalty' THEN 'E17 Event'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND ds.SeasonName='2016-17 Event - Suites' THEN 'E16 Event Suites'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND ds.SeasonName='2014-15 Event - Suites' THEN 'E14 Event Suites'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND ds.SeasonName='2015-16 Event - Suites' THEN 'E15 Event Suites'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND ds.SeasonName LIKE '2015-16 Event - Suites with Loge%' THEN 'E15 Event Loge Suites'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND ds.SeasonName='2017-18 Event - Suites' THEN 'E17 Event Suites'
 WHEN ISNULL(dpc.PC2,'') != 'G' AND ds.SeasonName='2018-19 Event - Suites' THEN 'E18 Event Suites'
 else NULL end SGBTag
 INTO #SGBCases
 FROM lightning.dbo.FactTicketSales_V2 fts (NOLOCK)
 JOIN lightning.dbo.DimPlan_V2 dp (NOLOCK) ON dp.DimPlanId = fts.DimPlanId
 JOIN lightning.dbo.DimSeason_V2 ds (NOLOCK) ON ds.DimSeasonId = fts.DimSeasonId
 JOIN lightning.dbo.DimTicketCustomer_V2 dtc (NOLOCK) ON dtc.DimTicketCustomerId = fts.DimTicketCustomerId
 JOIN lightning.dbo.vwDimCustomer_ModAcctId ssbid (NOLOCK) ON ssbid.AccountId=dtc.ETL__SSID_TM_acct_id AND ssbid.CustomerType='Primary' AND ssbid.SourceSystem = 'TM'
 JOIN lightning.dbo.DimPriceCode_V2 dpc (NOLOCK) ON dpc.DimPriceCodeId = fts.DimPriceCodeId
 JOIN (SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID, MAX(ds.SeasonYear) SeasonYear FROM lightning.dbo.FactTicketSales_V2 fts (NOLOCK)
 JOIN lightning.dbo.DimSeason_V2 ds (NOLOCK) ON ds.DimSeasonId = fts.DimSeasonId
 JOIN lightning.dbo.DimTicketCustomer_V2 dtc (NOLOCK) ON dtc.DimTicketCustomerId = fts.DimTicketCustomerId
 JOIN lightning.dbo.vwDimCustomer_ModAcctId ssbid (NOLOCK) ON ssbid.AccountId=dtc.ETL__SSID_TM_acct_id AND ssbid.CustomerType='Primary' AND ssbid.SourceSystem = 'TM'
 GROUP BY ssbid.SSB_CRMSYSTEM_CONTACT_ID) x
 ON x.SSB_CRMSYSTEM_CONTACT_ID = ssbid.SSB_CRMSYSTEM_CONTACT_ID AND x.SeasonYear = ds.Seasonyear
 LEFT JOIN lightning.dbo.DimTicketType_V2 dtt (NOLOCK) ON dtt.DimTicketTypeId = fts.DimTicketTypeId
 LEFT JOIN lightning.dbo.DimPlanType_V2 dpt (NOLOCK) ON dpt.DimPlanTypeId = fts.DimPlanTypeId 
  WHERE ds.SeasonName NOT LIKE '%parking%'

 SELECT x1.Guid, ISNULL(LEFT(STUFF((SELECT ' ' + x2.SGBTag + ' | '  AS [text()]
 FROM #SGBCases x2
 WHERE x1.GUID=x2.GUID
 ORDER BY x2.GUID, x2.SGBTag DESC
 FOR XML PATH ('')),1,1,''),8000),'') AS SGBTags
 INTO #SGBFields
 FROM #SGBCases x1


 UPDATE a
 SET a.new_singlegamebuyer = b.SGBTags
 FROM [dbo].Contact_Custom a
 JOIN #SGBFields b ON GUID=a.SSB_CRMSYSTEM_CONTACT_ID

 /*Tenure - Rookie*/

SELECT DISTINCT
    ssbid.SSB_CRMSYSTEM_CONTACT_ID AS GUID,
    CASE
        WHEN DATEDIFF(YEAR, MIN(fts.OrderDate), GETDATE()) = 1
             AND dp.PlanName LIKE '%Full Season%' THEN
            'Rookie'
        WHEN DATEDIFF(YEAR, MIN(fts.OrderDate), GETDATE()) = 2
             AND dp.PlanName LIKE '%Full Season%' THEN
            'Sophomore'
        WHEN DATEDIFF(YEAR, MIN(fts.OrderDate), GETDATE()) > 2
             AND dp.PlanName LIKE '%Full Season%' THEN
            CAST(DATEDIFF(YEAR, MIN(fts.OrderDate), GETDATE()) AS NVARCHAR(100))
        ELSE
            NULL
    END AS Tenure
INTO #Tenure
FROM Lightning.dbo.FactTicketSales_V2 fts
    JOIN Lightning.dbo.DimTicketCustomer_V2 dtc
        ON dtc.DimTicketCustomerId = fts.DimTicketCustomerId
    JOIN Lightning.dbo.vwDimCustomer_ModAcctId ssbid
        ON ssbid.AccountId = dtc.ETL__SSID_TM_acct_id
           AND ssbid.CustomerType = 'Primary'
           AND ssbid.SourceSystem = 'TM'
    JOIN Lightning.dbo.DimPlan_V2 dp
        ON dp.DimPlanId = fts.DimPlanId
GROUP BY ssbid.SSB_CRMSYSTEM_CONTACT_ID,
		 dp.PlanName;

UPDATE a
SET a.str_clienttenure = b.Tenure
FROM dbo.Contact_Custom a
JOIN #Tenure b ON b.GUID=a.SSB_CRMSYSTEM_CONTACT_ID

/*Home and Mobile Phone*/

--SELECT DISTINCT SSB_CRMSYSTEM_CONTACT_ID, CASE WHEN PhoneHomeIsCleanStatus='Valid' Then ISNULL(PhoneHome,'') ELSE '' END AS telephone2 , CASE WHEN PhoneCellIsCleanStatus = 'Valid' THEN  ISNULL(PhoneCell,'') ELSE '' END AS mobilephone
--INTO #phone
--FROM Lightning.dbo.vwDimCustomer_ModAcctId

UPDATE a
SET a.telephone2=b.PhoneHome,
a.mobilephone=b.PhoneCell
FROM dbo.Contact_Custom a
JOIN dbo.vwCompositeRecord_ModAcctID b ON b.SSB_CRMSYSTEM_CONTACT_ID = a.SSB_CRMSYSTEM_CONTACT_ID

/*Last Purchased*/

 SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID, MAX(dd.CalDate) new_lastpurchasedate
 INTO #lastpurch
 FROM Lightning.dbo.FactTicketSales_V2 fts (NOLOCK)
 JOIN Lightning.dbo.DimTicketCustomer_V2 dtc (NOLOCK) ON dtc.DimTicketCustomerId = fts.DimTicketCustomerId
 JOIN Lightning.dbo.vwDimCustomer_ModAcctId ssbid ON ssbid.AccountId = dtc.ETL__SSID_TM_acct_id AND ssbid.SourceSystem='TM' AND ssbid.CustomerType='Primary'
 JOIN Lightning.dbo.DimDate dd (NOLOCK) ON dd.DimDateId = fts.DimDateId
 GROUP BY ssbid.SSB_CRMSYSTEM_CONTACT_ID

 UPDATE a
 SET a.new_lastpurchasedate=b.new_lastpurchasedate
 FROM dbo.Contact_Custom a
 JOIN #lastpurch b ON b.SSB_CRMSYSTEM_CONTACT_ID = a.SSB_CRMSYSTEM_CONTACT_ID

 /*secondary*/
 SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID, COUNT(DISTINCT tex.event_id) [new_numofgamessoldonsecondary] 
 INTO #secondary
 FROM Lightning.ods.TM_Tex tex (NOLOCK)
 JOIN Lightning.dbo.vwDimCustomer_ModAcctId ssbid ON ssbid.AccountId=tex.acct_id AND ssbid.SourceSystem='TM' AND ssbid.CustomerType='Primary'
 WHERE tex.activity='ES'
 GROUP BY ssbid.SSB_CRMSYSTEM_CONTACT_ID

 UPDATE a
 SET a.new_numofgamessoldonsecondary = b.new_numofgamessoldonsecondary
 FROM dbo.Contact_Custom a 
 JOIN #secondary b ON b.SSB_CRMSYSTEM_CONTACT_ID = a.SSB_CRMSYSTEM_CONTACT_ID

 SELECT SSB_CRMSYSTEM_CONTACT_ID, CASE WHEN c.new_broker = 1 THEN 1
 WHEN dc.AccountType = 'Broker' THEN 1 ELSE 0 END AS new_broker 
 INTO #Broker
 FROM lightning.dbo.vwDimCustomer_ModAcctId dc 
 LEFT JOIN Lightning_Reporting.prodcopy.Contact c ON c.new_ssbcrmsystemcontactid = dc.SSB_CRMSYSTEM_CONTACT_ID
 UPDATE c
 SET c.new_broker=b.new_broker
 FROM Lightning_Integration.dbo.Contact_Custom c 
 JOIN #Broker b ON b.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID
 SELECT DISTINCT dc.SSB_CRMSYSTEM_CONTACT_ID, t.attrib_value str_externalprioritymodel
 INTO #Attrib
 FROM Lightning.ods.TM_CustAttrib t
 JOIN Lightning.dbo.vwDimCustomer_ModAcctId dc ON dc.SSID=CONCAT(t.acct_id,':',t.cust_name_id) AND dc.SourceSystem='TM'
 WHERE Category='Turnkey' AND attrib_name='Prospector Priority Model'
 
 UPDATE c
 SET c.str_externalprioritymodel=b.str_externalprioritymodel
 FROM Lightning_Integration.dbo.Contact_Custom c 
 JOIN #Attrib b ON b.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID

EXEC dbo.sp_CRMLoad_Contact_ProcessLoad_Criteria


GO
