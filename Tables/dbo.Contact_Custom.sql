CREATE TABLE [dbo].[Contact_Custom]
(
[SSB_CRMSYSTEM_ACCT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[new_ssbcrmsystemssidwinner] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[new_ssbSSIDWinnerSourceSystem] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_Ids] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DimCustIDs] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountID] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_category] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_clienttenure] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mobilephone] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[telephone2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_externalprioritymodel] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[new_groupbuyer] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[new_singlegamebuyer] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[new_emailunsubscribe] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[new_lastpurchasedate] [datetime] NULL,
[new_numofgamessoldonsecondary] [int] NULL,
[new_broker] [bit] NULL
)
GO
ALTER TABLE [dbo].[Contact_Custom] ADD CONSTRAINT [PK_Contact_Custom] PRIMARY KEY CLUSTERED  ([SSB_CRMSYSTEM_CONTACT_ID])
GO
