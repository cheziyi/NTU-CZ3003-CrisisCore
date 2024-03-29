USE [master]
GO
/****** Object:  Database [CrisisCore]    Script Date: 5/11/2016 9:02:32 PM ******/
CREATE DATABASE [CrisisCore]
GO
ALTER DATABASE [CrisisCore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CrisisCore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CrisisCore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CrisisCore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CrisisCore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CrisisCore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CrisisCore] SET ARITHABORT OFF 
GO
ALTER DATABASE [CrisisCore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CrisisCore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CrisisCore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CrisisCore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CrisisCore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CrisisCore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CrisisCore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CrisisCore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CrisisCore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CrisisCore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CrisisCore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CrisisCore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CrisisCore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CrisisCore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CrisisCore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CrisisCore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CrisisCore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CrisisCore] SET RECOVERY FULL 
GO
ALTER DATABASE [CrisisCore] SET  MULTI_USER 
GO
ALTER DATABASE [CrisisCore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CrisisCore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CrisisCore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CrisisCore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CrisisCore]
GO
/****** Object:  User [CrisisCore]    Script Date: 5/11/2016 9:02:33 PM ******/
CREATE USER [CrisisCore] FOR LOGIN [CrisisCore] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [CrisisCore]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/11/2016 9:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountId] [varchar](50) NOT NULL,
	[Password] [char](40) NOT NULL,
	[AccessLevel] [int] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Agencies]    Script Date: 5/11/2016 9:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agencies](
	[AgencyId] [varchar](10) NOT NULL,
	[AgencyName] [varchar](100) NOT NULL,
	[AgencyContact] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Agencies] PRIMARY KEY CLUSTERED 
(
	[AgencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Areas]    Script Date: 5/11/2016 9:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[AreaId] [varchar](2) NOT NULL,
	[AreaName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Incidents]    Script Date: 5/11/2016 9:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incidents](
	[IncidentId] [int] IDENTITY(1,1) NOT NULL,
	[PostalCode] [varchar](6) NOT NULL,
	[UnitNo] [varchar](10) NULL,
	[AddInfo] [text] NOT NULL,
	[IncidentTypeId] [varchar](10) NOT NULL,
	[AreaId] [varchar](2) NULL,
	[ReportName] [varchar](100) NOT NULL,
	[ReportMobile] [varchar](8) NOT NULL,
	[LocLat] [decimal](9, 6) NULL,
	[LocLon] [decimal](9, 6) NULL,
	[ReportDateTime] [datetime] NOT NULL,
	[ResolveDateTime] [datetime] NULL,
 CONSTRAINT [PK_Incidents] PRIMARY KEY CLUSTERED 
(
	[IncidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IncidentTypes]    Script Date: 5/11/2016 9:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncidentTypes](
	[IncidentTypeId] [varchar](10) NOT NULL,
	[IncidentTypeName] [varchar](100) NOT NULL,
	[AgencyId] [varchar](10) NULL,
 CONSTRAINT [PK_IncidentTypes] PRIMARY KEY CLUSTERED 
(
	[IncidentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Accounts] ([AccountId], [Password], [AccessLevel]) VALUES (N'mewr', N'86c729876bf378676f172eea8b90e015db5940ef', 1)
INSERT [dbo].[Accounts] ([AccountId], [Password], [AccessLevel]) VALUES (N'mha', N'e005871d30b64ab5988a19d40e6c125f44e56cb7', 1)
INSERT [dbo].[Accounts] ([AccountId], [Password], [AccessLevel]) VALUES (N'moh', N'17d46181ec2a0b93b6ba3a43156d44c904c1b752', 1)
INSERT [dbo].[Accounts] ([AccountId], [Password], [AccessLevel]) VALUES (N'operator', N'dbe0560393a0b9b57d5f64beef0b665ca96ba036', 2)
INSERT [dbo].[Accounts] ([AccountId], [Password], [AccessLevel]) VALUES (N'pmo', N'ba4c56572575dc3c76e253bec0b5122fa252da35', 1)
INSERT [dbo].[Agencies] ([AgencyId], [AgencyName], [AgencyContact]) VALUES (N'SCDF', N'Singapore Civil Defence Force', N'92299962')
INSERT [dbo].[Agencies] ([AgencyId], [AgencyName], [AgencyContact]) VALUES (N'SP', N'Singapore Power', N'92955428')
INSERT [dbo].[Areas] ([AreaId], [AreaName]) VALUES (N'C', N'Central')
INSERT [dbo].[Areas] ([AreaId], [AreaName]) VALUES (N'NE', N'North East')
INSERT [dbo].[Areas] ([AreaId], [AreaName]) VALUES (N'NW', N'North West')
INSERT [dbo].[Areas] ([AreaId], [AreaName]) VALUES (N'SE', N'South East')
INSERT [dbo].[Areas] ([AreaId], [AreaName]) VALUES (N'SW', N'South West')
SET IDENTITY_INSERT [dbo].[Incidents] ON 

INSERT [dbo].[Incidents] ([IncidentId], [PostalCode], [UnitNo], [AddInfo], [IncidentTypeId], [AreaId], [ReportName], [ReportMobile], [LocLat], [LocLon], [ReportDateTime], [ResolveDateTime]) VALUES (21, N'821126', N'#05-123', N'', N'DENGUE', N'NE', N'Calvin', N'92299962', CAST(1.394191 AS Decimal(9, 6)), CAST(103.911517 AS Decimal(9, 6)), CAST(N'2016-10-17T17:14:12.550' AS DateTime), NULL)
INSERT [dbo].[Incidents] ([IncidentId], [PostalCode], [UnitNo], [AddInfo], [IncidentTypeId], [AreaId], [ReportName], [ReportMobile], [LocLat], [LocLon], [ReportDateTime], [ResolveDateTime]) VALUES (22, N'639798', N'#02-321', N'Fire in Lab', N'FIRE', N'SW', N'Calvin', N'98765432', CAST(1.344233 AS Decimal(9, 6)), CAST(103.680142 AS Decimal(9, 6)), CAST(N'2016-10-17T17:17:22.577' AS DateTime), NULL)
INSERT [dbo].[Incidents] ([IncidentId], [PostalCode], [UnitNo], [AddInfo], [IncidentTypeId], [AreaId], [ReportName], [ReportMobile], [LocLat], [LocLon], [ReportDateTime], [ResolveDateTime]) VALUES (23, N'559389', N'', N'Person fainted.', N'AMBL', N'SE', N'Jane', N'83948483', CAST(1.369097 AS Decimal(9, 6)), CAST(103.863233 AS Decimal(9, 6)), CAST(N'2016-10-19T05:45:25.707' AS DateTime), NULL)
INSERT [dbo].[Incidents] ([IncidentId], [PostalCode], [UnitNo], [AddInfo], [IncidentTypeId], [AreaId], [ReportName], [ReportMobile], [LocLat], [LocLon], [ReportDateTime], [ResolveDateTime]) VALUES (24, N'560109', N'', N'', N'ZIKA', N'C', N'Jack', N'98765432', CAST(1.370202 AS Decimal(9, 6)), CAST(103.837762 AS Decimal(9, 6)), CAST(N'2016-10-19T07:43:48.800' AS DateTime), NULL)
INSERT [dbo].[Incidents] ([IncidentId], [PostalCode], [UnitNo], [AddInfo], [IncidentTypeId], [AreaId], [ReportName], [ReportMobile], [LocLat], [LocLon], [ReportDateTime], [ResolveDateTime]) VALUES (25, N'469552', N'#01-223', N'', N'ZIKA', N'SE', N'Sherry', N'93472732', CAST(1.331855 AS Decimal(9, 6)), CAST(103.946935 AS Decimal(9, 6)), CAST(N'2016-10-19T07:50:15.070' AS DateTime), NULL)
INSERT [dbo].[Incidents] ([IncidentId], [PostalCode], [UnitNo], [AddInfo], [IncidentTypeId], [AreaId], [ReportName], [ReportMobile], [LocLat], [LocLon], [ReportDateTime], [ResolveDateTime]) VALUES (26, N'307506', N'#12-493', N'', N'DENGUE', N'C', N'John', N'83456789', CAST(1.321061 AS Decimal(9, 6)), CAST(103.844476 AS Decimal(9, 6)), CAST(N'2016-10-19T07:52:40.740' AS DateTime), NULL)
INSERT [dbo].[Incidents] ([IncidentId], [PostalCode], [UnitNo], [AddInfo], [IncidentTypeId], [AreaId], [ReportName], [ReportMobile], [LocLat], [LocLon], [ReportDateTime], [ResolveDateTime]) VALUES (27, N'238884', N'', N'', N'AMBL', N'C', N'Jane', N'85239854', CAST(1.306339 AS Decimal(9, 6)), CAST(103.828639 AS Decimal(9, 6)), CAST(N'2016-10-19T07:53:28.663' AS DateTime), NULL)
INSERT [dbo].[Incidents] ([IncidentId], [PostalCode], [UnitNo], [AddInfo], [IncidentTypeId], [AreaId], [ReportName], [ReportMobile], [LocLat], [LocLon], [ReportDateTime], [ResolveDateTime]) VALUES (28, N'640932', N'#05-123', N'', N'FIRE', N'SW', N'Tester', N'87654321', CAST(1.341771 AS Decimal(9, 6)), CAST(103.688523 AS Decimal(9, 6)), CAST(N'2016-10-19T13:15:19.830' AS DateTime), CAST(N'2016-11-05T20:59:30.307' AS DateTime))
INSERT [dbo].[Incidents] ([IncidentId], [PostalCode], [UnitNo], [AddInfo], [IncidentTypeId], [AreaId], [ReportName], [ReportMobile], [LocLat], [LocLon], [ReportDateTime], [ResolveDateTime]) VALUES (29, N'874923', N'#07-124', N'Trapped in Lift', N'EVAC', N'SW', N'John Doe', N'98765432', CAST(1.345871 AS Decimal(9, 6)), CAST(103.750897 AS Decimal(9, 6)), CAST(N'2016-11-04T21:39:26.487' AS DateTime), NULL)
INSERT [dbo].[Incidents] ([IncidentId], [PostalCode], [UnitNo], [AddInfo], [IncidentTypeId], [AreaId], [ReportName], [ReportMobile], [LocLat], [LocLon], [ReportDateTime], [ResolveDateTime]) VALUES (30, N'319637', N'', N'Too hot in here!', N'GAS', N'C', N'Benedict Cumberbatch', N'92587452', CAST(1.340411 AS Decimal(9, 6)), CAST(103.847086 AS Decimal(9, 6)), CAST(N'2016-11-05T03:40:47.730' AS DateTime), NULL)
INSERT [dbo].[Incidents] ([IncidentId], [PostalCode], [UnitNo], [AddInfo], [IncidentTypeId], [AreaId], [ReportName], [ReportMobile], [LocLat], [LocLon], [ReportDateTime], [ResolveDateTime]) VALUES (31, N'730806', N'#06-239', N'', N'DENGUE', N'NW', N'Peter', N'91823332', CAST(1.441338 AS Decimal(9, 6)), CAST(103.786590 AS Decimal(9, 6)), CAST(N'2016-11-05T03:49:03.070' AS DateTime), NULL)
INSERT [dbo].[Incidents] ([IncidentId], [PostalCode], [UnitNo], [AddInfo], [IncidentTypeId], [AreaId], [ReportName], [ReportMobile], [LocLat], [LocLon], [ReportDateTime], [ResolveDateTime]) VALUES (32, N'650318', N'#08-234', N'Elderly fell down', N'AMBL', N'SW', N'Amanda', N'83437233', CAST(1.360902 AS Decimal(9, 6)), CAST(103.746911 AS Decimal(9, 6)), CAST(N'2016-11-05T03:50:06.313' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Incidents] OFF
INSERT [dbo].[IncidentTypes] ([IncidentTypeId], [IncidentTypeName], [AgencyId]) VALUES (N'AMBL', N'Emergency Ambulance', N'SCDF')
INSERT [dbo].[IncidentTypes] ([IncidentTypeId], [IncidentTypeName], [AgencyId]) VALUES (N'DENGUE', N'Dengue Cluster', NULL)
INSERT [dbo].[IncidentTypes] ([IncidentTypeId], [IncidentTypeName], [AgencyId]) VALUES (N'EVAC', N'Rescue and Evacuation', N'SCDF')
INSERT [dbo].[IncidentTypes] ([IncidentTypeId], [IncidentTypeName], [AgencyId]) VALUES (N'FIRE', N'Fire-Fighting', N'SCDF')
INSERT [dbo].[IncidentTypes] ([IncidentTypeId], [IncidentTypeName], [AgencyId]) VALUES (N'GAS', N'Gas Leak Control', N'SP')
INSERT [dbo].[IncidentTypes] ([IncidentTypeId], [IncidentTypeName], [AgencyId]) VALUES (N'ZIKA', N'Zika Cluster', NULL)
ALTER TABLE [dbo].[Incidents] ADD  CONSTRAINT [DF_Incidents_ReportDateTime]  DEFAULT (getdate()) FOR [ReportDateTime]
GO
ALTER TABLE [dbo].[Incidents]  WITH CHECK ADD  CONSTRAINT [FK_Incidents_IncidentTypes] FOREIGN KEY([IncidentTypeId])
REFERENCES [dbo].[IncidentTypes] ([IncidentTypeId])
GO
ALTER TABLE [dbo].[Incidents] CHECK CONSTRAINT [FK_Incidents_IncidentTypes]
GO
ALTER TABLE [dbo].[IncidentTypes]  WITH CHECK ADD  CONSTRAINT [FK_IncidentTypes_Agencies] FOREIGN KEY([AgencyId])
REFERENCES [dbo].[Agencies] ([AgencyId])
GO
ALTER TABLE [dbo].[IncidentTypes] CHECK CONSTRAINT [FK_IncidentTypes_Agencies]
GO
USE [master]
GO
ALTER DATABASE [CrisisCore] SET  READ_WRITE 
GO
