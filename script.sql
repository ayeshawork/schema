USE [eValueserve]
GO
/****** Object:  Table [dbo].[catalogMaster_dummy]    Script Date: 8/5/2021 3:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[catalogMaster_dummy](
	[catalogDataKey] [int] IDENTITY(1,1) NOT NULL,
	[catalogDate] [date] NULL,
	[companyKey] [int] NULL,
	[engineKey] [int] NULL,
	[unitKey] [int] NULL,
	[timestamp] [timestamp] NOT NULL,
	[ATA] [nvarchar](255) NULL,
	[partNumber] [nvarchar](255) NULL,
	[repairCode] [nvarchar](255) NULL,
	[repairDescription] [nvarchar](4000) NULL,
	[repairType] [nvarchar](255) NULL,
	[isOEM] [int] NULL,
	[isLifeX] [int] NULL,
	[isActive] [int] NULL,
	[comments] [nvarchar](255) NULL,
	[TAT] [int] NULL,
	[price] [int] NULL,
	[packageFlag] [int] NULL,
	[ServiceCount] [int] NULL,
	[Minimum_Qty] [int] NULL,
	[partNameInCatalog] [nvarchar](255) NULL,
	[repairCodeInCatalog] [nvarchar](255) NULL,
	[TATInCatalog] [nvarchar](255) NULL,
	[priceInCatalog] [nvarchar](255) NULL,
	[createdOn] [date] NULL,
	[dirty] [bit] NULL,
	[deletedBy] [nvarchar](50) NULL,
	[isDeleted] [bit] NOT NULL,
	[deletedOn] [datetime] NULL,
	[currentPrice] [int] NULL,
	[currentTAT] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[catalogDataKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[companyMaster]    Script Date: 8/5/2021 3:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[companyMaster](
	[companyKey] [int] IDENTITY(1,1) NOT NULL,
	[companyName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[companyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[companyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nonOEMMapping_dummy]    Script Date: 8/5/2021 3:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nonOEMMapping_dummy](
	[nonOEMKey] [int] IDENTITY(1,1) NOT NULL,
	[companyKey] [int] NULL,
	[engineKey] [int] NULL,
	[ATA] [nvarchar](255) NULL,
	[partNumber] [nvarchar](255) NULL,
	[repairCode] [nvarchar](255) NULL,
	[repairCodeMapped] [nvarchar](255) NULL,
	[repairType] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[nonOEMKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviewPriceTat]    Script Date: 8/5/2021 3:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviewPriceTat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ref_catalogDataKey] [int] NOT NULL,
	[price_proposed] [int] NULL,
	[TAT_proposed] [int] NULL,
	[proposed_on] [datetime] NULL,
	[proposed_by_user] [varchar](50) NULL,
	[unit_review] [bit] NULL,
	[corp_review] [bit] NULL,
	[approved_on] [datetime] NULL,
	[rv] [timestamp] NOT NULL,
	[approved_by] [nvarchar](50) NULL,
	[price_approved] [int] NULL,
	[TAT_approved] [int] NULL,
	[current_price] [int] NULL,
	[current_TAT] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[catalogMaster_dummy] ADD  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[catalogMaster_dummy] ADD  DEFAULT ((0)) FOR [dirty]
GO
ALTER TABLE [dbo].[catalogMaster_dummy] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[reviewPriceTat] ADD  DEFAULT (getdate()) FOR [proposed_on]
GO
ALTER TABLE [dbo].[reviewPriceTat] ADD  DEFAULT (user_name()) FOR [proposed_by_user]
GO
ALTER TABLE [dbo].[reviewPriceTat] ADD  DEFAULT ((0)) FOR [unit_review]
GO
ALTER TABLE [dbo].[reviewPriceTat] ADD  DEFAULT ((0)) FOR [corp_review]
GO
