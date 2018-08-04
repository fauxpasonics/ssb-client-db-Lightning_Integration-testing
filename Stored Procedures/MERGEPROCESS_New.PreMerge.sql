SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [MERGEPROCESS_New].[PreMerge]
    AS
Declare @LogDate datetime = (Select getdate())
 
INSERT INTO MERGEPROCESS_New.LogPreMergeAccount
Select a.FK_MergeID,ObjectType, 'Winner' MergeRecordType, @LogDate LogDate,
        -- updateme add all columns from prodcopy.
		accountcategorycode,	accountcategorycodename,	accountclassificationcode,	accountclassificationcodename,	accountid,	accountnumber,	accountratingcode,	accountratingcodename,	address1_addressid,	address1_addresstypecode,	address1_addresstypecodename,	address1_city,	address1_composite,	address1_country,	address1_county,	address1_fax,	address1_freighttermscode,	address1_freighttermscodename,	address1_latitude,	address1_line1,	address1_line2,	address1_line3,	address1_longitude,	address1_name,	address1_postalcode,	address1_postofficebox,	address1_primarycontactname,	address1_shippingmethodcode,	address1_shippingmethodcodename,	address1_stateorprovince,	address1_telephone1,	address1_telephone2,	address1_telephone3,	address1_upszone,	address1_utcoffset,	address2_addressid,	address2_addresstypecode,	address2_addresstypecodename,	address2_city,	address2_composite,	address2_country,	address2_county,	address2_fax,	address2_freighttermscode,	address2_freighttermscodename,	address2_latitude,	address2_line1,	address2_line2,	address2_line3,	address2_longitude,	address2_name,	address2_postalcode,	address2_postofficebox,	address2_primarycontactname,	address2_shippingmethodcode,	address2_shippingmethodcodename,	address2_stateorprovince,	address2_telephone1,	address2_telephone2,	address2_telephone3,	address2_upszone,	address2_utcoffset,	aging30,	aging30_base,	aging60,	aging60_base,	aging90,	aging90_base,	businesstypecode,	businesstypecodename,	createdby,	createdbyexternalparty,	createdbyexternalpartyname,	createdbyexternalpartyyominame,	createdbyname,	createdbyyominame,	createdon,	createdonbehalfby,	createdonbehalfbyname,	createdonbehalfbyyominame,	creditlimit,	creditlimit_base,	creditonhold,	creditonholdname,	customersizecode,	customersizecodename,	customertypecode,	customertypecodename,	defaultpricelevelid,	defaultpricelevelidname,	description,	donotbulkemail,	donotbulkemailname,	donotbulkpostalmail,	donotbulkpostalmailname,	donotemail,	donotemailname,	donotfax,	donotfaxname,	donotphone,	donotphonename,	donotpostalmail,	donotpostalmailname,	donotsendmarketingmaterialname,	donotsendmm,	emailaddress1,	emailaddress2,	emailaddress3,	entityimage,	entityimage_timestamp,	entityimage_url,	entityimageid,	exchangerate,	fax,	followemail,	followemailname,	ftpsiteurl,	importsequencenumber,	industrycode,	industrycodename,	isprivatename,	lastonholdtime,	lastusedincampaign,	marketcap,	marketcap_base,	marketingonly,	marketingonlyname,	masteraccountidname,	masteraccountidyominame,	masterid,	merged,	mergedname,	modifiedby,	modifiedbyexternalparty,	modifiedbyexternalpartyname,	modifiedbyexternalpartyyominame,	modifiedbyname,	modifiedbyyominame,	modifiedon,	modifiedonbehalfby,	modifiedonbehalfbyname,	modifiedonbehalfbyyominame,	name,	new_top200,	new_top200name,	numberofemployees,	onholdtime,	opendeals,	opendeals_date,	opendeals_state,	openrevenue,	openrevenue_base,	openrevenue_date,	openrevenue_state,	originatingleadid,	originatingleadidname,	originatingleadidyominame,	overriddencreatedon,	ownerid,	owneridname,	owneridtype,	owneridyominame,	ownershipcode,	ownershipcodename,	owningbusinessunit,	owningteam,	owninguser,	parentaccountid,	parentaccountidname,	parentaccountidyominame,	participatesinworkflow,	participatesinworkflowname,	paymenttermscode,	paymenttermscodename,	preferredappointmentdaycode,	preferredappointmentdaycodename,	preferredappointmenttimecode,	preferredappointmenttimecodename,	preferredcontactmethodcode,	preferredcontactmethodcodename,	preferredequipmentid,	preferredequipmentidname,	preferredserviceid,	preferredserviceidname,	preferredsystemuserid,	preferredsystemuseridname,	preferredsystemuseridyominame,	primarycontactid,	primarycontactidname,	primarycontactidyominame,	primarysatoriid,	primarytwitterid,	processid,	revenue,	revenue_base,	sharesoutstanding,	shippingmethodcode,	shippingmethodcodename,	sic,	slaid,	slainvokedid,	slainvokedidname,	slaname,	stageid,	statecode,	statecodename,	statuscode,	statuscodename,	stockexchange,	str_category,	str_clientsicdesc,	str_custom1,	str_custom2,	str_custom3,	str_custom4,	str_dwduplicate,	str_dwduplicatename,	str_dwid,	str_dwmodifiedon,	str_id,	str_idtext,	str_leadsourcecode,	str_leadsourcecodename,	str_league1,	str_league2,	str_league3,	str_league4,	str_league5,	str_league6,	str_league7,	str_league8,	str_marketingaccountindustryid,	str_marketingaccountindustryidname,	str_marketingaccountsourceid,	str_marketingaccountsourceidname,	str_number,	str_partnersalesperson,	str_partnersalespersonname,	str_partnersalespersonyominame,	str_partnerserviceperson,	str_partnerservicepersonname,	str_partnerservicepersonyominame,	str_partnershipclosedate,	str_partnershipcloseprobability,	str_partnershipcomments,	str_partnershipphase,	str_partnershiprevenue,	str_partnershiprevenue_base,	str_partnershipstatus,	str_premiumsalesperson,	str_premiumsalespersonname,	str_premiumsalespersonyominame,	str_premiumserviceperson,	str_premiumservicepersonname,	str_premiumservicepersonyominame,	str_search,	str_select,	str_selectname,	str_serviceperson,	str_servicepersonname,	str_servicepersonyominame,	str_source,	telephone1,	telephone2,	telephone3,	territorycode,	territorycodename,	territoryid,	territoryidname,	tickersymbol,	timespentbymeonemailandmeetings,	timezoneruleversionnumber,	transactioncurrencyid,	transactioncurrencyidname,	traversedpath,	utcconversiontimezonecode,	versionnumber,	websiteurl,	yominame,	copyloaddate,	new_ssbcrmsystemacctid,	new_ssbcrmsystemssidwinner,	new_ssbcrmsystemssidwinnersourcesystem,	new_ssbcrmsystemdimcustomerids
FROM MERGEPROCESS_New.Queue a
JOIN mergeprocess_new.tmp_pcaccount b
    ON a.Winning_ID = b.Accountid
UNION ALL
Select a.FK_MergeID,ObjectType, 'Loser' MergeRecordType, @LogDate LogDate,
        -- updateme add all columns from prodcopy.
		accountcategorycode,	accountcategorycodename,	accountclassificationcode,	accountclassificationcodename,	accountid,	accountnumber,	accountratingcode,	accountratingcodename,	address1_addressid,	address1_addresstypecode,	address1_addresstypecodename,	address1_city,	address1_composite,	address1_country,	address1_county,	address1_fax,	address1_freighttermscode,	address1_freighttermscodename,	address1_latitude,	address1_line1,	address1_line2,	address1_line3,	address1_longitude,	address1_name,	address1_postalcode,	address1_postofficebox,	address1_primarycontactname,	address1_shippingmethodcode,	address1_shippingmethodcodename,	address1_stateorprovince,	address1_telephone1,	address1_telephone2,	address1_telephone3,	address1_upszone,	address1_utcoffset,	address2_addressid,	address2_addresstypecode,	address2_addresstypecodename,	address2_city,	address2_composite,	address2_country,	address2_county,	address2_fax,	address2_freighttermscode,	address2_freighttermscodename,	address2_latitude,	address2_line1,	address2_line2,	address2_line3,	address2_longitude,	address2_name,	address2_postalcode,	address2_postofficebox,	address2_primarycontactname,	address2_shippingmethodcode,	address2_shippingmethodcodename,	address2_stateorprovince,	address2_telephone1,	address2_telephone2,	address2_telephone3,	address2_upszone,	address2_utcoffset,	aging30,	aging30_base,	aging60,	aging60_base,	aging90,	aging90_base,	businesstypecode,	businesstypecodename,	createdby,	createdbyexternalparty,	createdbyexternalpartyname,	createdbyexternalpartyyominame,	createdbyname,	createdbyyominame,	createdon,	createdonbehalfby,	createdonbehalfbyname,	createdonbehalfbyyominame,	creditlimit,	creditlimit_base,	creditonhold,	creditonholdname,	customersizecode,	customersizecodename,	customertypecode,	customertypecodename,	defaultpricelevelid,	defaultpricelevelidname,	description,	donotbulkemail,	donotbulkemailname,	donotbulkpostalmail,	donotbulkpostalmailname,	donotemail,	donotemailname,	donotfax,	donotfaxname,	donotphone,	donotphonename,	donotpostalmail,	donotpostalmailname,	donotsendmarketingmaterialname,	donotsendmm,	emailaddress1,	emailaddress2,	emailaddress3,	entityimage,	entityimage_timestamp,	entityimage_url,	entityimageid,	exchangerate,	fax,	followemail,	followemailname,	ftpsiteurl,	importsequencenumber,	industrycode,	industrycodename,	isprivatename,	lastonholdtime,	lastusedincampaign,	marketcap,	marketcap_base,	marketingonly,	marketingonlyname,	masteraccountidname,	masteraccountidyominame,	masterid,	merged,	mergedname,	modifiedby,	modifiedbyexternalparty,	modifiedbyexternalpartyname,	modifiedbyexternalpartyyominame,	modifiedbyname,	modifiedbyyominame,	modifiedon,	modifiedonbehalfby,	modifiedonbehalfbyname,	modifiedonbehalfbyyominame,	name,	new_top200,	new_top200name,	numberofemployees,	onholdtime,	opendeals,	opendeals_date,	opendeals_state,	openrevenue,	openrevenue_base,	openrevenue_date,	openrevenue_state,	originatingleadid,	originatingleadidname,	originatingleadidyominame,	overriddencreatedon,	ownerid,	owneridname,	owneridtype,	owneridyominame,	ownershipcode,	ownershipcodename,	owningbusinessunit,	owningteam,	owninguser,	parentaccountid,	parentaccountidname,	parentaccountidyominame,	participatesinworkflow,	participatesinworkflowname,	paymenttermscode,	paymenttermscodename,	preferredappointmentdaycode,	preferredappointmentdaycodename,	preferredappointmenttimecode,	preferredappointmenttimecodename,	preferredcontactmethodcode,	preferredcontactmethodcodename,	preferredequipmentid,	preferredequipmentidname,	preferredserviceid,	preferredserviceidname,	preferredsystemuserid,	preferredsystemuseridname,	preferredsystemuseridyominame,	primarycontactid,	primarycontactidname,	primarycontactidyominame,	primarysatoriid,	primarytwitterid,	processid,	revenue,	revenue_base,	sharesoutstanding,	shippingmethodcode,	shippingmethodcodename,	sic,	slaid,	slainvokedid,	slainvokedidname,	slaname,	stageid,	statecode,	statecodename,	statuscode,	statuscodename,	stockexchange,	str_category,	str_clientsicdesc,	str_custom1,	str_custom2,	str_custom3,	str_custom4,	str_dwduplicate,	str_dwduplicatename,	str_dwid,	str_dwmodifiedon,	str_id,	str_idtext,	str_leadsourcecode,	str_leadsourcecodename,	str_league1,	str_league2,	str_league3,	str_league4,	str_league5,	str_league6,	str_league7,	str_league8,	str_marketingaccountindustryid,	str_marketingaccountindustryidname,	str_marketingaccountsourceid,	str_marketingaccountsourceidname,	str_number,	str_partnersalesperson,	str_partnersalespersonname,	str_partnersalespersonyominame,	str_partnerserviceperson,	str_partnerservicepersonname,	str_partnerservicepersonyominame,	str_partnershipclosedate,	str_partnershipcloseprobability,	str_partnershipcomments,	str_partnershipphase,	str_partnershiprevenue,	str_partnershiprevenue_base,	str_partnershipstatus,	str_premiumsalesperson,	str_premiumsalespersonname,	str_premiumsalespersonyominame,	str_premiumserviceperson,	str_premiumservicepersonname,	str_premiumservicepersonyominame,	str_search,	str_select,	str_selectname,	str_serviceperson,	str_servicepersonname,	str_servicepersonyominame,	str_source,	telephone1,	telephone2,	telephone3,	territorycode,	territorycodename,	territoryid,	territoryidname,	tickersymbol,	timespentbymeonemailandmeetings,	timezoneruleversionnumber,	transactioncurrencyid,	transactioncurrencyidname,	traversedpath,	utcconversiontimezonecode,	versionnumber,	websiteurl,	yominame,	copyloaddate,	new_ssbcrmsystemacctid,	new_ssbcrmsystemssidwinner,	new_ssbcrmsystemssidwinnersourcesystem,	new_ssbcrmsystemdimcustomerids
FROM MERGEPROCESS_New.Queue a
JOIN mergeprocess_new.tmp_pcaccount b
    ON a.Losing_ID = b.Accountid
 
INSERT INTO MERGEPROCESS_New.LogPreMergeContact
SELECT a.FK_MergeID,ObjectType, 'Winner' MergeRecordType, @LogDate LogDate,
        -- updateme add all columns from prodcopy.
accountid,	accountidname,	accountidyominame,	accountrolecode,	accountrolecodename,	address1_addressid,	address1_addresstypecode,	address1_addresstypecodename,	address1_city,	address1_composite,	address1_country,	address1_county,	address1_fax,	address1_freighttermscode,	address1_freighttermscodename,	address1_latitude,	address1_line1,	address1_line2,	address1_line3,	address1_longitude,	address1_name,	address1_postalcode,	address1_postofficebox,	address1_primarycontactname,	address1_shippingmethodcode,	address1_shippingmethodcodename,	address1_stateorprovince,	address1_telephone1,	address1_telephone2,	address1_telephone3,	address1_upszone,	address1_utcoffset,	address2_addressid,	address2_addresstypecode,	address2_addresstypecodename,	address2_city,	address2_composite,	address2_country,	address2_county,	address2_fax,	address2_freighttermscode,	address2_freighttermscodename,	address2_latitude,	address2_line1,	address2_line2,	address2_line3,	address2_longitude,	address2_name,	address2_postalcode,	address2_postofficebox,	address2_primarycontactname,	address2_shippingmethodcode,	address2_shippingmethodcodename,	address2_stateorprovince,	address2_telephone1,	address2_telephone2,	address2_telephone3,	address2_upszone,	address2_utcoffset,	address3_addressid,	address3_addresstypecode,	address3_addresstypecodename,	address3_city,	address3_composite,	address3_country,	address3_county,	address3_fax,	address3_freighttermscode,	address3_freighttermscodename,	address3_latitude,	address3_line1,	address3_line2,	address3_line3,	address3_longitude,	address3_name,	address3_postalcode,	address3_postofficebox,	address3_primarycontactname,	address3_shippingmethodcode,	address3_shippingmethodcodename,	address3_stateorprovince,	address3_telephone1,	address3_telephone2,	address3_telephone3,	address3_upszone,	address3_utcoffset,	aging30,	aging30_base,	aging60,	aging60_base,	aging90,	aging90_base,	anniversary,	annualincome,	annualincome_base,	assistantname,	assistantphone,	birthdate,	business2,	callback,	childrensnames,	company,	contactid,	createdby,	createdbyexternalparty,	createdbyexternalpartyname,	createdbyexternalpartyyominame,	createdbyname,	createdbyyominame,	createdon,	createdonbehalfby,	createdonbehalfbyname,	createdonbehalfbyyominame,	creditlimit,	creditlimit_base,	creditonhold,	creditonholdname,	customersizecode,	customersizecodename,	customertypecode,	customertypecodename,	defaultpricelevelid,	defaultpricelevelidname,	department,	description,	donotbulkemail,	donotbulkemailname,	donotbulkpostalmail,	donotbulkpostalmailname,	donotemail,	donotemailname,	donotfax,	donotfaxname,	donotphone,	donotphonename,	donotpostalmail,	donotpostalmailname,	donotsendmarketingmaterialname,	donotsendmm,	educationcode,	educationcodename,	emailaddress1,	emailaddress2,	emailaddress3,	employeeid,	entityimage,	entityimage_timestamp,	entityimage_url,	entityimageid,	exchangerate,	externaluseridentifier,	familystatuscode,	familystatuscodename,	fax,	firstname,	followemail,	followemailname,	ftpsiteurl,	fullname,	gendercode,	gendercodename,	governmentid,	haschildrencode,	haschildrencodename,	home2,	importsequencenumber,	isbackofficecustomer,	isbackofficecustomername,	isprivatename,	jobtitle,	lastname,	lastonholdtime,	lastusedincampaign,	leadsourcecode,	leadsourcecodename,	managername,	managerphone,	marketingonly,	marketingonlyname,	mastercontactidname,	mastercontactidyominame,	masterid,	merged,	mergedname,	middlename,	mobilephone,	modifiedby,	modifiedbyexternalparty,	modifiedbyexternalpartyname,	modifiedbyexternalpartyyominame,	modifiedbyname,	modifiedbyyominame,	modifiedon,	modifiedonbehalfby,	modifiedonbehalfbyname,	modifiedonbehalfbyyominame,	new_attendedstormgame,	new_attendedstormgamename,	new_czechnight,	new_czechnightname,	new_fanexperience201718,	new_fanexperience201718name,	new_favoritealumni,	new_favoritecollegeteam,	new_favoritetbsplayer,	new_groupsinterests,	new_l16groupbuyer,	new_l16groupbuyername,	new_linkedinprofile,	new_planupgradenotes,	new_planutilizationtype,	new_planutilizationtypename,	new_retiredactivemilitary,	new_retiredactivemilitaryname,	new_s16groupbuyer,	new_s16groupbuyername,	new_seatsforservicebuyer,	new_seatsforservicebuyername,	new_sept19comp,	new_sept19compname,	new_sept24comp,	new_sept24compname,	new_sept24loft,	new_sept24loftname,	new_sticksoffire,	new_sticksoffirename,	new_stmranking,	new_stmrankingname,	new_stormprospect1119,	new_stormprospect1119name,	new_ticketupgradegoals,	new_ticketupgradegoalsname,	new_top200,	new_top200name,	new_totalplanspend,	new_totalplanspend_base,	nickname,	numberofchildren,	onholdtime,	originatingleadid,	originatingleadidname,	originatingleadidyominame,	overriddencreatedon,	ownerid,	owneridname,	owneridtype,	owneridyominame,	owningbusinessunit,	owningteam,	owninguser,	pager,	parentcontactid,	parentcontactidname,	parentcontactidyominame,	parentcustomerid,	parentcustomeridname,	parentcustomeridtype,	parentcustomeridyominame,	participatesinworkflow,	participatesinworkflowname,	paymenttermscode,	paymenttermscodename,	preferredappointmentdaycode,	preferredappointmentdaycodename,	preferredappointmenttimecode,	preferredappointmenttimecodename,	preferredcontactmethodcode,	preferredcontactmethodcodename,	preferredequipmentid,	preferredequipmentidname,	preferredserviceid,	preferredserviceidname,	preferredsystemuserid,	preferredsystemuseridname,	preferredsystemuseridyominame,	processid,	salutation,	shippingmethodcode,	shippingmethodcodename,	slaid,	slainvokedid,	slainvokedidname,	slaname,	spousesname,	stageid,	statecode,	statecodename,	statuscode,	statuscodename,	str_agerange,	str_allspendtotal,	str_allspendtotal_base,	str_casesource,	str_casestatus,	str_casesubject,	str_casetype,	str_category,	str_clientbadinfo,	str_clientbadinfoname,	str_clientboltforlife,	str_clientboltforlifename,	str_clientboltsbusinessalliance,	str_clientboltsbusinessalliancename,	str_clientchristian,	str_clientchristianname,	str_clientcomedy,	str_clientcomedyname,	str_clientcontemporary,	str_clientcontemporaryname,	str_clientcustomerlifetimevalue,	str_clientcustomerlifetimevalue_base,	str_clientdistancefromarena,	str_clientexternalage,	str_clientexternalchildpresent,	str_clientexternalchildpresentname,	str_clientexternaldiscretionaryincome,	str_clientexternalincome,	str_clientexternalmaritalstatus,	str_clientexternaloccupation,	str_clientforumnewsletter,	str_clientforumnewslettername,	str_clientforumpresales,	str_clientforumpresalesname,	str_clientgroupsjoined,	str_clientinitialpurchasedate,	str_clientjazz,	str_clientjazzname,	str_clientjktempflag,	str_clientl14groupbuyer,	str_clientl14groupbuyername,	str_clientl15groupbuyer,	str_clientl15groupbuyername,	str_clientlightninginsider,	str_clientlightninginsidername,	str_clientlightningnews,	str_clientlightningnewsname,	str_clientlilahtempflag,	str_clientmilitary,	str_clientmilitaryname,	str_clientnotes,	str_clientnotrenewingreason,	str_clientnotrenewingreasonname,	str_clientonboarded,	str_clientonboardedname,	str_clientpoints,	str_clientpointsgoal,	str_clientpointspercent,	str_clientpointsremaining,	str_clientpremiumsalesperson,	str_clientpremiumsalespersonname,	str_clientpremiumsalespersonyominame,	str_clientpremiumserviceperson,	str_clientpremiumservicepersonname,	str_clientpremiumservicepersonyominame,	str_clients15groupbuyer,	str_clients15groupbuyername,	str_clients16groupbuyer,	str_clients16groupbuyername,	str_clientseatlocation,	str_clientshirtsize,	str_clientshirtsizename,	str_clientsnowbird,	str_clientspouseshirtsize,	str_clientspouseshirtsizename,	str_clientstmaccountid,	str_clientstmlevel,	str_clientstmmembershipplan,	str_clientstmmembershipplanl14,	str_clientstmmembershipplanl14name,	str_clientstmmembershipplanname,	str_clientstmtier,	str_clientstormnews,	str_clientstormnewsname,	str_clienttenure,	str_clienttheatrical,	str_clienttheatricalname,	str_clienttype,	str_clienttypename,	str_clientupcomingbirthday,	str_college,	str_concertinterests,	str_dwcompanies,	str_dwduplicate,	str_dwduplicatename,	str_dwid,	str_dwmodifiedon,	str_externalcapacitymodel,	str_externalclustername,	str_externalprioritymodel,	str_facebookhandle,	str_favoritedestination,	str_favoriteplayer,	str_favoriterestaurant,	str_favoriteteam,	str_hobbies,	str_hometown,	str_householdincome,	str_householdincome_base,	str_id,	str_idtext,	str_instagramhandle,	str_lastactivitydate,	str_marketingcontactsourceid,	str_marketingcontactsourceidname,	str_marketingcontacttypeid,	str_marketingcontacttypeidname,	str_musicclassical,	str_musicclassicalname,	str_musiccountry,	str_musiccountryname,	str_musicpop,	str_musicpopname,	str_musicrap,	str_musicrapname,	str_musicrock,	str_musicrockname,	str_neglectmeter,	str_neglectreason,	str_nextactivitydate,	str_nextactivitysubject,	str_number,	str_openactivitycount,	str_openticketcase,	str_openticketcasename,	str_openticketopportunity,	str_openticketopportunityname,	str_oppdaysinstage,	str_oppproduct,	str_oppsource,	str_oppstage,	str_otherinformation,	str_partnerid,	str_partneridname,	str_partneridyominame,	str_premiumtype,	str_premiumtypename,	str_priority,	str_rating,	str_ratingname,	str_score,	str_search,	str_select,	str_selectname,	str_serviceperson,	str_servicepersonname,	str_servicepersonyominame,	str_showsfamily,	str_showsfamilyname,	str_since,	str_source,	str_sportsinterests,	str_ticketeventtotalall,	str_ticketeventtotalarena,	str_ticketeventtotallast,	str_ticketeventtotalthis,	str_ticketnumberaverageall,	str_ticketnumberaveragearena,	str_ticketnumberaveragelast,	str_ticketnumberaveragethis,	str_ticketnumbertotalall,	str_ticketnumbertotalarena,	str_ticketnumbertotallast,	str_ticketnumbertotalthis,	str_ticketpriceaverageall,	str_ticketpriceaverageall_base,	str_ticketpriceaveragearena,	str_ticketpriceaveragearena_base,	str_ticketpriceaveragelast,	str_ticketpriceaveragelast_base,	str_ticketpriceaveragethis,	str_ticketpriceaveragethis_base,	str_ticketspendaverageall,	str_ticketspendaverageall_base,	str_ticketspendaveragearena,	str_ticketspendaveragearena_base,	str_ticketspendaveragelast,	str_ticketspendaveragelast_base,	str_ticketspendaveragethis,	str_ticketspendaveragethis_base,	str_ticketspendtotalall,	str_ticketspendtotalall_base,	str_ticketspendtotalarena,	str_ticketspendtotalarena_base,	str_ticketspendtotallast,	str_ticketspendtotallast_base,	str_ticketspendtotalthis,	str_ticketspendtotalthis_base,	str_twitterhandle,	suffix,	telephone1,	telephone2,	telephone3,	territorycode,	territorycodename,	timespentbymeonemailandmeetings,	timezoneruleversionnumber,	transactioncurrencyid,	transactioncurrencyidname,	traversedpath,	utcconversiontimezonecode,	versionnumber,	websiteurl,	yomifirstname,	yomifullname,	yomilastname,	yomimiddlename,	copyloaddate,	new_ssbcrmsystemcontactid,	new_ssbcrmsystemacctid,	new_ssbcrmsystemssidwinner,	new_ssbssidwinnersourcesystem,	new_ssbcrmsystemdimcustomerids,	new_broker,	new_brokername,	new_chalktalk,	new_chalktalkname,	new_stmtemperature,	new_stmtemperaturename,	new_groupbuyer,	new_singlegamebuyer,	new_emailunsubscribe,	new_lastpurchasedate,	new_numofgamessoldonsecondary,	new_emailunsubscribename
FROM MERGEPROCESS_New.Queue a
JOIN mergeprocess_new.tmp_pccontact b
    ON a.Winning_ID = b.contactid
UNION ALL
SELECT a.FK_MergeID,ObjectType, 'Loser' MergeRecordType, @LogDate LogDate,
        -- updateme add all columns from prodcopy.
accountid,	accountidname,	accountidyominame,	accountrolecode,	accountrolecodename,	address1_addressid,	address1_addresstypecode,	address1_addresstypecodename,	address1_city,	address1_composite,	address1_country,	address1_county,	address1_fax,	address1_freighttermscode,	address1_freighttermscodename,	address1_latitude,	address1_line1,	address1_line2,	address1_line3,	address1_longitude,	address1_name,	address1_postalcode,	address1_postofficebox,	address1_primarycontactname,	address1_shippingmethodcode,	address1_shippingmethodcodename,	address1_stateorprovince,	address1_telephone1,	address1_telephone2,	address1_telephone3,	address1_upszone,	address1_utcoffset,	address2_addressid,	address2_addresstypecode,	address2_addresstypecodename,	address2_city,	address2_composite,	address2_country,	address2_county,	address2_fax,	address2_freighttermscode,	address2_freighttermscodename,	address2_latitude,	address2_line1,	address2_line2,	address2_line3,	address2_longitude,	address2_name,	address2_postalcode,	address2_postofficebox,	address2_primarycontactname,	address2_shippingmethodcode,	address2_shippingmethodcodename,	address2_stateorprovince,	address2_telephone1,	address2_telephone2,	address2_telephone3,	address2_upszone,	address2_utcoffset,	address3_addressid,	address3_addresstypecode,	address3_addresstypecodename,	address3_city,	address3_composite,	address3_country,	address3_county,	address3_fax,	address3_freighttermscode,	address3_freighttermscodename,	address3_latitude,	address3_line1,	address3_line2,	address3_line3,	address3_longitude,	address3_name,	address3_postalcode,	address3_postofficebox,	address3_primarycontactname,	address3_shippingmethodcode,	address3_shippingmethodcodename,	address3_stateorprovince,	address3_telephone1,	address3_telephone2,	address3_telephone3,	address3_upszone,	address3_utcoffset,	aging30,	aging30_base,	aging60,	aging60_base,	aging90,	aging90_base,	anniversary,	annualincome,	annualincome_base,	assistantname,	assistantphone,	birthdate,	business2,	callback,	childrensnames,	company,	contactid,	createdby,	createdbyexternalparty,	createdbyexternalpartyname,	createdbyexternalpartyyominame,	createdbyname,	createdbyyominame,	createdon,	createdonbehalfby,	createdonbehalfbyname,	createdonbehalfbyyominame,	creditlimit,	creditlimit_base,	creditonhold,	creditonholdname,	customersizecode,	customersizecodename,	customertypecode,	customertypecodename,	defaultpricelevelid,	defaultpricelevelidname,	department,	description,	donotbulkemail,	donotbulkemailname,	donotbulkpostalmail,	donotbulkpostalmailname,	donotemail,	donotemailname,	donotfax,	donotfaxname,	donotphone,	donotphonename,	donotpostalmail,	donotpostalmailname,	donotsendmarketingmaterialname,	donotsendmm,	educationcode,	educationcodename,	emailaddress1,	emailaddress2,	emailaddress3,	employeeid,	entityimage,	entityimage_timestamp,	entityimage_url,	entityimageid,	exchangerate,	externaluseridentifier,	familystatuscode,	familystatuscodename,	fax,	firstname,	followemail,	followemailname,	ftpsiteurl,	fullname,	gendercode,	gendercodename,	governmentid,	haschildrencode,	haschildrencodename,	home2,	importsequencenumber,	isbackofficecustomer,	isbackofficecustomername,	isprivatename,	jobtitle,	lastname,	lastonholdtime,	lastusedincampaign,	leadsourcecode,	leadsourcecodename,	managername,	managerphone,	marketingonly,	marketingonlyname,	mastercontactidname,	mastercontactidyominame,	masterid,	merged,	mergedname,	middlename,	mobilephone,	modifiedby,	modifiedbyexternalparty,	modifiedbyexternalpartyname,	modifiedbyexternalpartyyominame,	modifiedbyname,	modifiedbyyominame,	modifiedon,	modifiedonbehalfby,	modifiedonbehalfbyname,	modifiedonbehalfbyyominame,	new_attendedstormgame,	new_attendedstormgamename,	new_czechnight,	new_czechnightname,	new_fanexperience201718,	new_fanexperience201718name,	new_favoritealumni,	new_favoritecollegeteam,	new_favoritetbsplayer,	new_groupsinterests,	new_l16groupbuyer,	new_l16groupbuyername,	new_linkedinprofile,	new_planupgradenotes,	new_planutilizationtype,	new_planutilizationtypename,	new_retiredactivemilitary,	new_retiredactivemilitaryname,	new_s16groupbuyer,	new_s16groupbuyername,	new_seatsforservicebuyer,	new_seatsforservicebuyername,	new_sept19comp,	new_sept19compname,	new_sept24comp,	new_sept24compname,	new_sept24loft,	new_sept24loftname,	new_sticksoffire,	new_sticksoffirename,	new_stmranking,	new_stmrankingname,	new_stormprospect1119,	new_stormprospect1119name,	new_ticketupgradegoals,	new_ticketupgradegoalsname,	new_top200,	new_top200name,	new_totalplanspend,	new_totalplanspend_base,	nickname,	numberofchildren,	onholdtime,	originatingleadid,	originatingleadidname,	originatingleadidyominame,	overriddencreatedon,	ownerid,	owneridname,	owneridtype,	owneridyominame,	owningbusinessunit,	owningteam,	owninguser,	pager,	parentcontactid,	parentcontactidname,	parentcontactidyominame,	parentcustomerid,	parentcustomeridname,	parentcustomeridtype,	parentcustomeridyominame,	participatesinworkflow,	participatesinworkflowname,	paymenttermscode,	paymenttermscodename,	preferredappointmentdaycode,	preferredappointmentdaycodename,	preferredappointmenttimecode,	preferredappointmenttimecodename,	preferredcontactmethodcode,	preferredcontactmethodcodename,	preferredequipmentid,	preferredequipmentidname,	preferredserviceid,	preferredserviceidname,	preferredsystemuserid,	preferredsystemuseridname,	preferredsystemuseridyominame,	processid,	salutation,	shippingmethodcode,	shippingmethodcodename,	slaid,	slainvokedid,	slainvokedidname,	slaname,	spousesname,	stageid,	statecode,	statecodename,	statuscode,	statuscodename,	str_agerange,	str_allspendtotal,	str_allspendtotal_base,	str_casesource,	str_casestatus,	str_casesubject,	str_casetype,	str_category,	str_clientbadinfo,	str_clientbadinfoname,	str_clientboltforlife,	str_clientboltforlifename,	str_clientboltsbusinessalliance,	str_clientboltsbusinessalliancename,	str_clientchristian,	str_clientchristianname,	str_clientcomedy,	str_clientcomedyname,	str_clientcontemporary,	str_clientcontemporaryname,	str_clientcustomerlifetimevalue,	str_clientcustomerlifetimevalue_base,	str_clientdistancefromarena,	str_clientexternalage,	str_clientexternalchildpresent,	str_clientexternalchildpresentname,	str_clientexternaldiscretionaryincome,	str_clientexternalincome,	str_clientexternalmaritalstatus,	str_clientexternaloccupation,	str_clientforumnewsletter,	str_clientforumnewslettername,	str_clientforumpresales,	str_clientforumpresalesname,	str_clientgroupsjoined,	str_clientinitialpurchasedate,	str_clientjazz,	str_clientjazzname,	str_clientjktempflag,	str_clientl14groupbuyer,	str_clientl14groupbuyername,	str_clientl15groupbuyer,	str_clientl15groupbuyername,	str_clientlightninginsider,	str_clientlightninginsidername,	str_clientlightningnews,	str_clientlightningnewsname,	str_clientlilahtempflag,	str_clientmilitary,	str_clientmilitaryname,	str_clientnotes,	str_clientnotrenewingreason,	str_clientnotrenewingreasonname,	str_clientonboarded,	str_clientonboardedname,	str_clientpoints,	str_clientpointsgoal,	str_clientpointspercent,	str_clientpointsremaining,	str_clientpremiumsalesperson,	str_clientpremiumsalespersonname,	str_clientpremiumsalespersonyominame,	str_clientpremiumserviceperson,	str_clientpremiumservicepersonname,	str_clientpremiumservicepersonyominame,	str_clients15groupbuyer,	str_clients15groupbuyername,	str_clients16groupbuyer,	str_clients16groupbuyername,	str_clientseatlocation,	str_clientshirtsize,	str_clientshirtsizename,	str_clientsnowbird,	str_clientspouseshirtsize,	str_clientspouseshirtsizename,	str_clientstmaccountid,	str_clientstmlevel,	str_clientstmmembershipplan,	str_clientstmmembershipplanl14,	str_clientstmmembershipplanl14name,	str_clientstmmembershipplanname,	str_clientstmtier,	str_clientstormnews,	str_clientstormnewsname,	str_clienttenure,	str_clienttheatrical,	str_clienttheatricalname,	str_clienttype,	str_clienttypename,	str_clientupcomingbirthday,	str_college,	str_concertinterests,	str_dwcompanies,	str_dwduplicate,	str_dwduplicatename,	str_dwid,	str_dwmodifiedon,	str_externalcapacitymodel,	str_externalclustername,	str_externalprioritymodel,	str_facebookhandle,	str_favoritedestination,	str_favoriteplayer,	str_favoriterestaurant,	str_favoriteteam,	str_hobbies,	str_hometown,	str_householdincome,	str_householdincome_base,	str_id,	str_idtext,	str_instagramhandle,	str_lastactivitydate,	str_marketingcontactsourceid,	str_marketingcontactsourceidname,	str_marketingcontacttypeid,	str_marketingcontacttypeidname,	str_musicclassical,	str_musicclassicalname,	str_musiccountry,	str_musiccountryname,	str_musicpop,	str_musicpopname,	str_musicrap,	str_musicrapname,	str_musicrock,	str_musicrockname,	str_neglectmeter,	str_neglectreason,	str_nextactivitydate,	str_nextactivitysubject,	str_number,	str_openactivitycount,	str_openticketcase,	str_openticketcasename,	str_openticketopportunity,	str_openticketopportunityname,	str_oppdaysinstage,	str_oppproduct,	str_oppsource,	str_oppstage,	str_otherinformation,	str_partnerid,	str_partneridname,	str_partneridyominame,	str_premiumtype,	str_premiumtypename,	str_priority,	str_rating,	str_ratingname,	str_score,	str_search,	str_select,	str_selectname,	str_serviceperson,	str_servicepersonname,	str_servicepersonyominame,	str_showsfamily,	str_showsfamilyname,	str_since,	str_source,	str_sportsinterests,	str_ticketeventtotalall,	str_ticketeventtotalarena,	str_ticketeventtotallast,	str_ticketeventtotalthis,	str_ticketnumberaverageall,	str_ticketnumberaveragearena,	str_ticketnumberaveragelast,	str_ticketnumberaveragethis,	str_ticketnumbertotalall,	str_ticketnumbertotalarena,	str_ticketnumbertotallast,	str_ticketnumbertotalthis,	str_ticketpriceaverageall,	str_ticketpriceaverageall_base,	str_ticketpriceaveragearena,	str_ticketpriceaveragearena_base,	str_ticketpriceaveragelast,	str_ticketpriceaveragelast_base,	str_ticketpriceaveragethis,	str_ticketpriceaveragethis_base,	str_ticketspendaverageall,	str_ticketspendaverageall_base,	str_ticketspendaveragearena,	str_ticketspendaveragearena_base,	str_ticketspendaveragelast,	str_ticketspendaveragelast_base,	str_ticketspendaveragethis,	str_ticketspendaveragethis_base,	str_ticketspendtotalall,	str_ticketspendtotalall_base,	str_ticketspendtotalarena,	str_ticketspendtotalarena_base,	str_ticketspendtotallast,	str_ticketspendtotallast_base,	str_ticketspendtotalthis,	str_ticketspendtotalthis_base,	str_twitterhandle,	suffix,	telephone1,	telephone2,	telephone3,	territorycode,	territorycodename,	timespentbymeonemailandmeetings,	timezoneruleversionnumber,	transactioncurrencyid,	transactioncurrencyidname,	traversedpath,	utcconversiontimezonecode,	versionnumber,	websiteurl,	yomifirstname,	yomifullname,	yomilastname,	yomimiddlename,	copyloaddate,	new_ssbcrmsystemcontactid,	new_ssbcrmsystemacctid,	new_ssbcrmsystemssidwinner,	new_ssbssidwinnersourcesystem,	new_ssbcrmsystemdimcustomerids,	new_broker,	new_brokername,	new_chalktalk,	new_chalktalkname,	new_stmtemperature,	new_stmtemperaturename,	new_groupbuyer,	new_singlegamebuyer,	new_emailunsubscribe,	new_lastpurchasedate,	new_numofgamessoldonsecondary,	new_emailunsubscribename
FROM MERGEPROCESS_New.Queue a
JOIN mergeprocess_new.tmp_pccontact b
    ON a.Losing_ID = b.contactid
 
 
GO
