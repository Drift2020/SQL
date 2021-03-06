USE [master]
GO
/****** Object:  Database [Tourist_agency]    Script Date: 22.03.2018 15:44:23 ******/
CREATE DATABASE [Tourist_agency]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tourist_agency', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Tourist_agency.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Tourist_agency_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Tourist_agency_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Tourist_agency] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tourist_agency].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tourist_agency] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tourist_agency] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tourist_agency] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tourist_agency] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tourist_agency] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tourist_agency] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tourist_agency] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Tourist_agency] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tourist_agency] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tourist_agency] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tourist_agency] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tourist_agency] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tourist_agency] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tourist_agency] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tourist_agency] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tourist_agency] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tourist_agency] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tourist_agency] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tourist_agency] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tourist_agency] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tourist_agency] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tourist_agency] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tourist_agency] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tourist_agency] SET RECOVERY FULL 
GO
ALTER DATABASE [Tourist_agency] SET  MULTI_USER 
GO
ALTER DATABASE [Tourist_agency] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tourist_agency] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tourist_agency] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tourist_agency] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tourist_agency', N'ON'
GO
USE [Tourist_agency]
GO
/****** Object:  Table [dbo].[Accountant_Resorts_link]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accountant_Resorts_link](
	[ResortsID] [int] NOT NULL,
	[AccountantID] [int] NOT NULL,
 CONSTRAINT [PK_Accountant] PRIMARY KEY CLUSTERED 
(
	[ResortsID] ASC,
	[AccountantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country_City_link]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country_City_link](
	[CountryID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
 CONSTRAINT [PK_Country_City_link] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC,
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Surname] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[TimeID] [int] NOT NULL,
 CONSTRAINT [PK_Hotels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hotels_Resorts_link]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels_Resorts_link](
	[HotelsID] [int] NOT NULL,
	[ResortsID] [int] NOT NULL,
 CONSTRAINT [PK_Hotels_Resorts_link] PRIMARY KEY CLUSTERED 
(
	[HotelsID] ASC,
	[ResortsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manager_Resortsl_link]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager_Resortsl_link](
	[ResortsID] [int] NOT NULL,
	[ManagerID] [int] NOT NULL,
 CONSTRAINT [PK_Manager_Resortsl_link] PRIMARY KEY CLUSTERED 
(
	[ResortsID] ASC,
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Surname] [nvarchar](255) NOT NULL,
	[Date_out] [date] NOT NULL,
	[TourID] [int] NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Price_for_Hotels]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price_for_Hotels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Price_for_Tourism] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Price_for_Transport]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price_for_Transport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Price_for_Transport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Price_for_Types_of_rest]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price_for_Types_of_rest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Price_for_Tourism_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resorts]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resorts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CountryID] [int] NOT NULL,
	[TransportID] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resortsl_Director_link]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resortsl_Director_link](
	[ResortsID] [int] NOT NULL,
	[DirectorID] [int] NOT NULL,
 CONSTRAINT [PK_Resortsl_Director_ID] PRIMARY KEY CLUSTERED 
(
	[ResortsID] ASC,
	[DirectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Time_of_Hotel]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time_of_Hotel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Day] [int] NOT NULL,
	[MoneyID] [int] NOT NULL,
 CONSTRAINT [PK_Time_of_Hotel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Time_of_Types_of_rest]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time_of_Types_of_rest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Day] [int] NOT NULL,
	[MoneyID] [int] NOT NULL,
 CONSTRAINT [PK_Time_of_Tourism] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tour]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tour_Resorts_link]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour_Resorts_link](
	[TourID] [int] NOT NULL,
	[ResortsID] [int] NOT NULL,
 CONSTRAINT [PK_Tour_Resorts_link] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC,
	[ResortsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types_of_rest]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types_of_rest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[TimeID] [int] NOT NULL,
 CONSTRAINT [PK_Types_of_rest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types_of_rest_Resortsl_Link]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types_of_rest_Resortsl_Link](
	[ResortsID] [int] NOT NULL,
	[Types_of_restID] [int] NOT NULL,
 CONSTRAINT [PK_Types_of_rest_Resortsl_Link] PRIMARY KEY CLUSTERED 
(
	[ResortsID] ASC,
	[Types_of_restID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types_of_transport]    Script Date: 22.03.2018 15:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types_of_transport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[MoneyID] [int] NOT NULL,
 CONSTRAINT [PK_Types_of_transport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([ID], [Name]) VALUES (1, N'Вена')
INSERT [dbo].[City] ([ID], [Name]) VALUES (2, N'Минск')
INSERT [dbo].[City] ([ID], [Name]) VALUES (3, N'Москва')
INSERT [dbo].[City] ([ID], [Name]) VALUES (4, N'Париж')
INSERT [dbo].[City] ([ID], [Name]) VALUES (5, N'Берлин')
INSERT [dbo].[City] ([ID], [Name]) VALUES (6, N'Стокгольм')
INSERT [dbo].[City] ([ID], [Name]) VALUES (7, N'Афіни')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([ID], [Name]) VALUES (1, N'Австрия')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (2, N'Германия')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (3, N'Франция')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (4, N'Росия')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (5, N'Швеция')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (6, N'Греция')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (7, N'Белорусь')
SET IDENTITY_INSERT [dbo].[Country] OFF
INSERT [dbo].[Country_City_link] ([CountryID], [CityID]) VALUES (1, 1)
INSERT [dbo].[Country_City_link] ([CountryID], [CityID]) VALUES (2, 5)
INSERT [dbo].[Country_City_link] ([CountryID], [CityID]) VALUES (3, 4)
INSERT [dbo].[Country_City_link] ([CountryID], [CityID]) VALUES (4, 3)
INSERT [dbo].[Country_City_link] ([CountryID], [CityID]) VALUES (5, 6)
INSERT [dbo].[Country_City_link] ([CountryID], [CityID]) VALUES (6, 7)
INSERT [dbo].[Country_City_link] ([CountryID], [CityID]) VALUES (7, 2)
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([ID], [Name], [Surname]) VALUES (1, N'Директор', N'Директорный')
INSERT [dbo].[Employees] ([ID], [Name], [Surname]) VALUES (5, N'Менеджер', N'Менеджоровый')
INSERT [dbo].[Employees] ([ID], [Name], [Surname]) VALUES (6, N'Бугалтер', N'Бугалтерный')
INSERT [dbo].[Employees] ([ID], [Name], [Surname]) VALUES (7, N'Менеджер2', N'Менеджоровый')
INSERT [dbo].[Employees] ([ID], [Name], [Surname]) VALUES (8, N'Менеджер3', N'Менеджоровый')
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Hotels] ON 

INSERT [dbo].[Hotels] ([ID], [Name], [TimeID]) VALUES (1, N'Бухта', 1)
INSERT [dbo].[Hotels] ([ID], [Name], [TimeID]) VALUES (2, N'Бухта', 2)
INSERT [dbo].[Hotels] ([ID], [Name], [TimeID]) VALUES (3, N'Бухта', 3)
INSERT [dbo].[Hotels] ([ID], [Name], [TimeID]) VALUES (4, N'Бухта', 4)
INSERT [dbo].[Hotels] ([ID], [Name], [TimeID]) VALUES (5, N'Бухта', 5)
INSERT [dbo].[Hotels] ([ID], [Name], [TimeID]) VALUES (6, N'Бухта', 6)
SET IDENTITY_INSERT [dbo].[Hotels] OFF
INSERT [dbo].[Hotels_Resorts_link] ([HotelsID], [ResortsID]) VALUES (1, 11)
INSERT [dbo].[Hotels_Resorts_link] ([HotelsID], [ResortsID]) VALUES (1, 16)
INSERT [dbo].[Hotels_Resorts_link] ([HotelsID], [ResortsID]) VALUES (2, 12)
INSERT [dbo].[Hotels_Resorts_link] ([HotelsID], [ResortsID]) VALUES (3, 13)
INSERT [dbo].[Hotels_Resorts_link] ([HotelsID], [ResortsID]) VALUES (3, 14)
INSERT [dbo].[Hotels_Resorts_link] ([HotelsID], [ResortsID]) VALUES (4, 15)
INSERT [dbo].[Hotels_Resorts_link] ([HotelsID], [ResortsID]) VALUES (5, 17)
INSERT [dbo].[Manager_Resortsl_link] ([ResortsID], [ManagerID]) VALUES (11, 1)
INSERT [dbo].[Manager_Resortsl_link] ([ResortsID], [ManagerID]) VALUES (11, 5)
INSERT [dbo].[Manager_Resortsl_link] ([ResortsID], [ManagerID]) VALUES (11, 6)
INSERT [dbo].[Manager_Resortsl_link] ([ResortsID], [ManagerID]) VALUES (11, 7)
INSERT [dbo].[Manager_Resortsl_link] ([ResortsID], [ManagerID]) VALUES (11, 8)
INSERT [dbo].[Manager_Resortsl_link] ([ResortsID], [ManagerID]) VALUES (12, 1)
INSERT [dbo].[Manager_Resortsl_link] ([ResortsID], [ManagerID]) VALUES (12, 5)
INSERT [dbo].[Manager_Resortsl_link] ([ResortsID], [ManagerID]) VALUES (12, 6)
INSERT [dbo].[Manager_Resortsl_link] ([ResortsID], [ManagerID]) VALUES (12, 7)
INSERT [dbo].[Manager_Resortsl_link] ([ResortsID], [ManagerID]) VALUES (12, 8)
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([ID], [Name], [Surname], [Date_out], [TourID]) VALUES (1, N'Александр', N'Буженко', CAST(0x6B3E0B00 AS Date), 1)
INSERT [dbo].[People] ([ID], [Name], [Surname], [Date_out], [TourID]) VALUES (3, N'Виталий', N'Полянский', CAST(0x4D3E0B00 AS Date), 2)
INSERT [dbo].[People] ([ID], [Name], [Surname], [Date_out], [TourID]) VALUES (4, N'Петя', N'Пяточкин', CAST(0x8A3E0B00 AS Date), 3)
SET IDENTITY_INSERT [dbo].[People] OFF
SET IDENTITY_INSERT [dbo].[Price_for_Hotels] ON 

INSERT [dbo].[Price_for_Hotels] ([ID], [Price]) VALUES (1, 100.0000)
INSERT [dbo].[Price_for_Hotels] ([ID], [Price]) VALUES (2, 200.0000)
INSERT [dbo].[Price_for_Hotels] ([ID], [Price]) VALUES (3, 300.0000)
INSERT [dbo].[Price_for_Hotels] ([ID], [Price]) VALUES (4, 375.0000)
INSERT [dbo].[Price_for_Hotels] ([ID], [Price]) VALUES (5, 450.0000)
INSERT [dbo].[Price_for_Hotels] ([ID], [Price]) VALUES (6, 850.0000)
INSERT [dbo].[Price_for_Hotels] ([ID], [Price]) VALUES (7, 1000.0000)
SET IDENTITY_INSERT [dbo].[Price_for_Hotels] OFF
SET IDENTITY_INSERT [dbo].[Price_for_Transport] ON 

INSERT [dbo].[Price_for_Transport] ([ID], [Price]) VALUES (1, 50.0000)
INSERT [dbo].[Price_for_Transport] ([ID], [Price]) VALUES (2, 100.0000)
INSERT [dbo].[Price_for_Transport] ([ID], [Price]) VALUES (3, 150.0000)
INSERT [dbo].[Price_for_Transport] ([ID], [Price]) VALUES (4, 200.0000)
INSERT [dbo].[Price_for_Transport] ([ID], [Price]) VALUES (5, 300.0000)
INSERT [dbo].[Price_for_Transport] ([ID], [Price]) VALUES (6, 400.0000)
INSERT [dbo].[Price_for_Transport] ([ID], [Price]) VALUES (7, 500.0000)
SET IDENTITY_INSERT [dbo].[Price_for_Transport] OFF
SET IDENTITY_INSERT [dbo].[Price_for_Types_of_rest] ON 

INSERT [dbo].[Price_for_Types_of_rest] ([ID], [Price]) VALUES (1, 100.0000)
INSERT [dbo].[Price_for_Types_of_rest] ([ID], [Price]) VALUES (2, 200.0000)
INSERT [dbo].[Price_for_Types_of_rest] ([ID], [Price]) VALUES (3, 400.0000)
INSERT [dbo].[Price_for_Types_of_rest] ([ID], [Price]) VALUES (4, 700.0000)
SET IDENTITY_INSERT [dbo].[Price_for_Types_of_rest] OFF
SET IDENTITY_INSERT [dbo].[Resorts] ON 

INSERT [dbo].[Resorts] ([ID], [Name], [CountryID], [TransportID]) VALUES (11, N'Путь по Австрии', 1, 1)
INSERT [dbo].[Resorts] ([ID], [Name], [CountryID], [TransportID]) VALUES (12, N'Путь по Германии', 2, 6)
INSERT [dbo].[Resorts] ([ID], [Name], [CountryID], [TransportID]) VALUES (13, N'Путь по Франции', 3, 4)
INSERT [dbo].[Resorts] ([ID], [Name], [CountryID], [TransportID]) VALUES (14, N'Дерби по Росии', 4, 1)
INSERT [dbo].[Resorts] ([ID], [Name], [CountryID], [TransportID]) VALUES (15, N'Путь по Швеции', 5, 1)
INSERT [dbo].[Resorts] ([ID], [Name], [CountryID], [TransportID]) VALUES (16, N'Путь по Греции', 6, 6)
INSERT [dbo].[Resorts] ([ID], [Name], [CountryID], [TransportID]) VALUES (17, N'Путь по Белорусии', 7, 2)
SET IDENTITY_INSERT [dbo].[Resorts] OFF
SET IDENTITY_INSERT [dbo].[Time_of_Hotel] ON 

INSERT [dbo].[Time_of_Hotel] ([ID], [Day], [MoneyID]) VALUES (1, 2, 1)
INSERT [dbo].[Time_of_Hotel] ([ID], [Day], [MoneyID]) VALUES (2, 3, 2)
INSERT [dbo].[Time_of_Hotel] ([ID], [Day], [MoneyID]) VALUES (3, 4, 3)
INSERT [dbo].[Time_of_Hotel] ([ID], [Day], [MoneyID]) VALUES (4, 6, 4)
INSERT [dbo].[Time_of_Hotel] ([ID], [Day], [MoneyID]) VALUES (5, 7, 6)
INSERT [dbo].[Time_of_Hotel] ([ID], [Day], [MoneyID]) VALUES (6, 7, 7)
SET IDENTITY_INSERT [dbo].[Time_of_Hotel] OFF
SET IDENTITY_INSERT [dbo].[Time_of_Types_of_rest] ON 

INSERT [dbo].[Time_of_Types_of_rest] ([ID], [Day], [MoneyID]) VALUES (1, 4, 1)
INSERT [dbo].[Time_of_Types_of_rest] ([ID], [Day], [MoneyID]) VALUES (2, 6, 2)
INSERT [dbo].[Time_of_Types_of_rest] ([ID], [Day], [MoneyID]) VALUES (3, 10, 3)
INSERT [dbo].[Time_of_Types_of_rest] ([ID], [Day], [MoneyID]) VALUES (4, 20, 4)
SET IDENTITY_INSERT [dbo].[Time_of_Types_of_rest] OFF
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([ID], [Name]) VALUES (1, N'Орлиные горы')
INSERT [dbo].[Tour] ([ID], [Name]) VALUES (2, N'Европа за 24 дня')
INSERT [dbo].[Tour] ([ID], [Name]) VALUES (3, N'От Махачкалы до Вены')
SET IDENTITY_INSERT [dbo].[Tour] OFF
INSERT [dbo].[Tour_Resorts_link] ([TourID], [ResortsID]) VALUES (1, 15)
INSERT [dbo].[Tour_Resorts_link] ([TourID], [ResortsID]) VALUES (1, 16)
INSERT [dbo].[Tour_Resorts_link] ([TourID], [ResortsID]) VALUES (2, 11)
INSERT [dbo].[Tour_Resorts_link] ([TourID], [ResortsID]) VALUES (2, 12)
INSERT [dbo].[Tour_Resorts_link] ([TourID], [ResortsID]) VALUES (2, 13)
INSERT [dbo].[Tour_Resorts_link] ([TourID], [ResortsID]) VALUES (3, 11)
INSERT [dbo].[Tour_Resorts_link] ([TourID], [ResortsID]) VALUES (3, 14)
INSERT [dbo].[Tour_Resorts_link] ([TourID], [ResortsID]) VALUES (3, 17)
SET IDENTITY_INSERT [dbo].[Types_of_rest] ON 

INSERT [dbo].[Types_of_rest] ([ID], [Name], [TimeID]) VALUES (1, N'Народные гуляния', 1)
INSERT [dbo].[Types_of_rest] ([ID], [Name], [TimeID]) VALUES (2, N'Варка пива', 2)
INSERT [dbo].[Types_of_rest] ([ID], [Name], [TimeID]) VALUES (3, N'Горный спорт', 4)
INSERT [dbo].[Types_of_rest] ([ID], [Name], [TimeID]) VALUES (4, N'Море', 1)
INSERT [dbo].[Types_of_rest] ([ID], [Name], [TimeID]) VALUES (5, N'Море', 2)
INSERT [dbo].[Types_of_rest] ([ID], [Name], [TimeID]) VALUES (6, N'Туризм по городу', 2)
SET IDENTITY_INSERT [dbo].[Types_of_rest] OFF
INSERT [dbo].[Types_of_rest_Resortsl_Link] ([ResortsID], [Types_of_restID]) VALUES (11, 1)
INSERT [dbo].[Types_of_rest_Resortsl_Link] ([ResortsID], [Types_of_restID]) VALUES (12, 2)
INSERT [dbo].[Types_of_rest_Resortsl_Link] ([ResortsID], [Types_of_restID]) VALUES (13, 6)
INSERT [dbo].[Types_of_rest_Resortsl_Link] ([ResortsID], [Types_of_restID]) VALUES (14, 4)
INSERT [dbo].[Types_of_rest_Resortsl_Link] ([ResortsID], [Types_of_restID]) VALUES (15, 3)
INSERT [dbo].[Types_of_rest_Resortsl_Link] ([ResortsID], [Types_of_restID]) VALUES (16, 1)
INSERT [dbo].[Types_of_rest_Resortsl_Link] ([ResortsID], [Types_of_restID]) VALUES (17, 6)
SET IDENTITY_INSERT [dbo].[Types_of_transport] ON 

INSERT [dbo].[Types_of_transport] ([ID], [Name], [MoneyID]) VALUES (1, N'Автобус', 1)
INSERT [dbo].[Types_of_transport] ([ID], [Name], [MoneyID]) VALUES (2, N'Поезд-плацкарт', 2)
INSERT [dbo].[Types_of_transport] ([ID], [Name], [MoneyID]) VALUES (4, N'Поезд-люкс', 4)
INSERT [dbo].[Types_of_transport] ([ID], [Name], [MoneyID]) VALUES (5, N'Поезд-купе', 3)
INSERT [dbo].[Types_of_transport] ([ID], [Name], [MoneyID]) VALUES (6, N'Inter-city', 3)
INSERT [dbo].[Types_of_transport] ([ID], [Name], [MoneyID]) VALUES (7, N'Самолёт', 7)
INSERT [dbo].[Types_of_transport] ([ID], [Name], [MoneyID]) VALUES (9, N'Корабль', 6)
SET IDENTITY_INSERT [dbo].[Types_of_transport] OFF
ALTER TABLE [dbo].[Accountant_Resorts_link]  WITH CHECK ADD  CONSTRAINT [FK_Accountant_Resorts_link_Employees] FOREIGN KEY([AccountantID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Accountant_Resorts_link] CHECK CONSTRAINT [FK_Accountant_Resorts_link_Employees]
GO
ALTER TABLE [dbo].[Accountant_Resorts_link]  WITH CHECK ADD  CONSTRAINT [FK_Accountant_Resorts_link_Resorts] FOREIGN KEY([ResortsID])
REFERENCES [dbo].[Resorts] ([ID])
GO
ALTER TABLE [dbo].[Accountant_Resorts_link] CHECK CONSTRAINT [FK_Accountant_Resorts_link_Resorts]
GO
ALTER TABLE [dbo].[Country_City_link]  WITH CHECK ADD  CONSTRAINT [FK_Country_City_link_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[Country_City_link] CHECK CONSTRAINT [FK_Country_City_link_City]
GO
ALTER TABLE [dbo].[Country_City_link]  WITH CHECK ADD  CONSTRAINT [FK_Country_City_link_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[Country_City_link] CHECK CONSTRAINT [FK_Country_City_link_Country]
GO
ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD  CONSTRAINT [FK_Hotels_Time_of_Hotel] FOREIGN KEY([TimeID])
REFERENCES [dbo].[Time_of_Hotel] ([ID])
GO
ALTER TABLE [dbo].[Hotels] CHECK CONSTRAINT [FK_Hotels_Time_of_Hotel]
GO
ALTER TABLE [dbo].[Hotels_Resorts_link]  WITH CHECK ADD  CONSTRAINT [FK_Hotels_Resorts_link_Hotels] FOREIGN KEY([HotelsID])
REFERENCES [dbo].[Hotels] ([ID])
GO
ALTER TABLE [dbo].[Hotels_Resorts_link] CHECK CONSTRAINT [FK_Hotels_Resorts_link_Hotels]
GO
ALTER TABLE [dbo].[Hotels_Resorts_link]  WITH CHECK ADD  CONSTRAINT [FK_Hotels_Resorts_link_Resorts] FOREIGN KEY([ResortsID])
REFERENCES [dbo].[Resorts] ([ID])
GO
ALTER TABLE [dbo].[Hotels_Resorts_link] CHECK CONSTRAINT [FK_Hotels_Resorts_link_Resorts]
GO
ALTER TABLE [dbo].[Manager_Resortsl_link]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Resortsl_link_Employees] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Manager_Resortsl_link] CHECK CONSTRAINT [FK_Manager_Resortsl_link_Employees]
GO
ALTER TABLE [dbo].[Manager_Resortsl_link]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Resortsl_link_Resorts] FOREIGN KEY([ResortsID])
REFERENCES [dbo].[Resorts] ([ID])
GO
ALTER TABLE [dbo].[Manager_Resortsl_link] CHECK CONSTRAINT [FK_Manager_Resortsl_link_Resorts]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Tour] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Tour]
GO
ALTER TABLE [dbo].[Resorts]  WITH CHECK ADD  CONSTRAINT [FK_Resorts_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[Resorts] CHECK CONSTRAINT [FK_Resorts_Country]
GO
ALTER TABLE [dbo].[Resorts]  WITH CHECK ADD  CONSTRAINT [FK_Resorts_Types_of_transport] FOREIGN KEY([TransportID])
REFERENCES [dbo].[Types_of_transport] ([ID])
GO
ALTER TABLE [dbo].[Resorts] CHECK CONSTRAINT [FK_Resorts_Types_of_transport]
GO
ALTER TABLE [dbo].[Resortsl_Director_link]  WITH CHECK ADD  CONSTRAINT [FK_Resortsl_Director_link_Employees] FOREIGN KEY([DirectorID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Resortsl_Director_link] CHECK CONSTRAINT [FK_Resortsl_Director_link_Employees]
GO
ALTER TABLE [dbo].[Resortsl_Director_link]  WITH CHECK ADD  CONSTRAINT [FK_Resortsl_Director_link_Resorts] FOREIGN KEY([ResortsID])
REFERENCES [dbo].[Resorts] ([ID])
GO
ALTER TABLE [dbo].[Resortsl_Director_link] CHECK CONSTRAINT [FK_Resortsl_Director_link_Resorts]
GO
ALTER TABLE [dbo].[Time_of_Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Time_of_Hotel_Price_for_Hotels] FOREIGN KEY([MoneyID])
REFERENCES [dbo].[Price_for_Hotels] ([ID])
GO
ALTER TABLE [dbo].[Time_of_Hotel] CHECK CONSTRAINT [FK_Time_of_Hotel_Price_for_Hotels]
GO
ALTER TABLE [dbo].[Time_of_Types_of_rest]  WITH CHECK ADD  CONSTRAINT [FK_Time_of_Types_of_rest_Price_for_Types_of_rest] FOREIGN KEY([MoneyID])
REFERENCES [dbo].[Price_for_Types_of_rest] ([ID])
GO
ALTER TABLE [dbo].[Time_of_Types_of_rest] CHECK CONSTRAINT [FK_Time_of_Types_of_rest_Price_for_Types_of_rest]
GO
ALTER TABLE [dbo].[Tour_Resorts_link]  WITH CHECK ADD  CONSTRAINT [FK_Tour_Resorts_link_Resorts] FOREIGN KEY([ResortsID])
REFERENCES [dbo].[Resorts] ([ID])
GO
ALTER TABLE [dbo].[Tour_Resorts_link] CHECK CONSTRAINT [FK_Tour_Resorts_link_Resorts]
GO
ALTER TABLE [dbo].[Tour_Resorts_link]  WITH CHECK ADD  CONSTRAINT [FK_Tour_Resorts_link_Tour] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[Tour_Resorts_link] CHECK CONSTRAINT [FK_Tour_Resorts_link_Tour]
GO
ALTER TABLE [dbo].[Types_of_rest]  WITH CHECK ADD  CONSTRAINT [FK_Types_of_rest_Time_of_Types_of_rest] FOREIGN KEY([TimeID])
REFERENCES [dbo].[Time_of_Types_of_rest] ([ID])
GO
ALTER TABLE [dbo].[Types_of_rest] CHECK CONSTRAINT [FK_Types_of_rest_Time_of_Types_of_rest]
GO
ALTER TABLE [dbo].[Types_of_rest_Resortsl_Link]  WITH CHECK ADD  CONSTRAINT [FK_Types_of_rest_Resortsl_Link_Resorts] FOREIGN KEY([ResortsID])
REFERENCES [dbo].[Resorts] ([ID])
GO
ALTER TABLE [dbo].[Types_of_rest_Resortsl_Link] CHECK CONSTRAINT [FK_Types_of_rest_Resortsl_Link_Resorts]
GO
ALTER TABLE [dbo].[Types_of_rest_Resortsl_Link]  WITH CHECK ADD  CONSTRAINT [FK_Types_of_rest_Resortsl_Link_Types_of_rest] FOREIGN KEY([Types_of_restID])
REFERENCES [dbo].[Types_of_rest] ([ID])
GO
ALTER TABLE [dbo].[Types_of_rest_Resortsl_Link] CHECK CONSTRAINT [FK_Types_of_rest_Resortsl_Link_Types_of_rest]
GO
ALTER TABLE [dbo].[Types_of_transport]  WITH CHECK ADD  CONSTRAINT [FK_Types_of_transport_Price_for_Transport] FOREIGN KEY([MoneyID])
REFERENCES [dbo].[Price_for_Transport] ([ID])
GO
ALTER TABLE [dbo].[Types_of_transport] CHECK CONSTRAINT [FK_Types_of_transport_Price_for_Transport]
GO
USE [master]
GO
ALTER DATABASE [Tourist_agency] SET  READ_WRITE 
GO
