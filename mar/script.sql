USE [master]
GO
/****** Object:  Database [Supermarket_warehouse]    Script Date: 19.03.2018 10:28:21 ******/
CREATE DATABASE [Supermarket_warehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Supermarket_warehouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MAMORY\MSSQL\DATA\Supermarket_warehouse.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Supermarket_warehouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MAMORY\MSSQL\DATA\Supermarket_warehouse_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Supermarket_warehouse] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Supermarket_warehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Supermarket_warehouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Supermarket_warehouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Supermarket_warehouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Supermarket_warehouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Supermarket_warehouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET RECOVERY FULL 
GO
ALTER DATABASE [Supermarket_warehouse] SET  MULTI_USER 
GO
ALTER DATABASE [Supermarket_warehouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Supermarket_warehouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Supermarket_warehouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Supermarket_warehouse] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Supermarket_warehouse] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Supermarket_warehouse', N'ON'
GO
ALTER DATABASE [Supermarket_warehouse] SET QUERY_STORE = OFF
GO
USE [Supermarket_warehouse]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Supermarket_warehouse]
GO
/****** Object:  Table [dbo].[Adressa]    Script Date: 19.03.2018 10:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adressa](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Adressa] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adressa_link]    Script Date: 19.03.2018 10:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adressa_link](
	[FirmID] [int] NOT NULL,
	[AdressaID] [int] NOT NULL,
 CONSTRAINT [PK_Adressa_communications] PRIMARY KEY CLUSTERED 
(
	[FirmID] ASC,
	[AdressaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boss]    Script Date: 19.03.2018 10:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boss](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Surname] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Boss]]] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 19.03.2018 10:28:21 ******/
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
/****** Object:  Table [dbo].[City_link]    Script Date: 19.03.2018 10:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City_link](
	[FirmID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
 CONSTRAINT [PK_City_link] PRIMARY KEY CLUSTERED 
(
	[FirmID] ASC,
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Count]    Script Date: 19.03.2018 10:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Count](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Count] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Count_link]    Script Date: 19.03.2018 10:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Count_link](
	[ProductID] [int] NOT NULL,
	[Count_ProductID] [int] NOT NULL,
 CONSTRAINT [PK_Count_link] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[Count_ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 19.03.2018 10:28:21 ******/
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
/****** Object:  Table [dbo].[Country_link]    Script Date: 19.03.2018 10:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country_link](
	[FirmID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
 CONSTRAINT [PK_Country_link] PRIMARY KEY CLUSTERED 
(
	[FirmID] ASC,
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Date_of_receipt]    Script Date: 19.03.2018 10:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date_of_receipt](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Date_of_receipt_link]    Script Date: 19.03.2018 10:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date_of_receipt_link](
	[ProductID] [int] NOT NULL,
	[Date_receiptID] [int] NOT NULL,
 CONSTRAINT [PK_Date_of_receipt_link] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[Date_receiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fio_link]    Script Date: 19.03.2018 10:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fio_link](
	[ProductID] [int] NOT NULL,
	[FioID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FIO_Person]    Script Date: 19.03.2018 10:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FIO_Person](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Surname] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_FIO_Person] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firm]    Script Date: 19.03.2018 10:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firm](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Firm] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mark_up]    Script Date: 19.03.2018 10:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mark_up](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Count] [money] NOT NULL,
 CONSTRAINT [PK_Mark_up] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mark_up_link]    Script Date: 19.03.2018 10:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mark_up_link](
	[ProductID] [int] NOT NULL,
	[Mark_up] [int] NOT NULL,
 CONSTRAINT [PK_Mark_up_link] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[Mark_up] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 19.03.2018 10:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirmID] [int] NOT NULL,
	[Number] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Price]    Script Date: 19.03.2018 10:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Price] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.03.2018 10:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[FirmID] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_category]    Script Date: 19.03.2018 10:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Сategory] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Product_category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_category_link]    Script Date: 19.03.2018 10:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_category_link](
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Product_category_link] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_life]    Script Date: 19.03.2018 10:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_life](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Product_shelf_life] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_life_link]    Script Date: 19.03.2018 10:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_life_link](
	[ProductID] [int] NOT NULL,
	[DateID] [int] NOT NULL,
 CONSTRAINT [PK_Product_subsidiary_date] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Вoss_link]    Script Date: 19.03.2018 10:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Вoss_link](
	[FirmID] [int] NOT NULL,
	[BossID] [int] NOT NULL,
 CONSTRAINT [PK_Вoss_link] PRIMARY KEY CLUSTERED 
(
	[FirmID] ASC,
	[BossID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adressa] ON 

INSERT [dbo].[Adressa] ([ID], [Name]) VALUES (1, N'strit 1')
INSERT [dbo].[Adressa] ([ID], [Name]) VALUES (2, N'strit 2')
INSERT [dbo].[Adressa] ([ID], [Name]) VALUES (3, N'strit 3')
SET IDENTITY_INSERT [dbo].[Adressa] OFF
INSERT [dbo].[Adressa_link] ([FirmID], [AdressaID]) VALUES (1, 2)
INSERT [dbo].[Adressa_link] ([FirmID], [AdressaID]) VALUES (2, 1)
INSERT [dbo].[Adressa_link] ([FirmID], [AdressaID]) VALUES (3, 3)
INSERT [dbo].[Adressa_link] ([FirmID], [AdressaID]) VALUES (4, 3)
SET IDENTITY_INSERT [dbo].[Boss] ON 

INSERT [dbo].[Boss] ([ID], [Name], [Surname]) VALUES (1, N'Оруто', N'Рукояту')
INSERT [dbo].[Boss] ([ID], [Name], [Surname]) VALUES (2, N'Линкла', N'Доликса')
INSERT [dbo].[Boss] ([ID], [Name], [Surname]) VALUES (3, N'Парток', N'Шикрин')
INSERT [dbo].[Boss] ([ID], [Name], [Surname]) VALUES (4, N'Клегмон', N'Фокляр')
INSERT [dbo].[Boss] ([ID], [Name], [Surname]) VALUES (5, N'Женкус', N'Фрокчер')
SET IDENTITY_INSERT [dbo].[Boss] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([ID], [Name]) VALUES (1, N'Токио')
INSERT [dbo].[City] ([ID], [Name]) VALUES (2, N'Одесса')
INSERT [dbo].[City] ([ID], [Name]) VALUES (3, N'Факусима')
INSERT [dbo].[City] ([ID], [Name]) VALUES (4, N'Ляшкон')
SET IDENTITY_INSERT [dbo].[City] OFF
INSERT [dbo].[City_link] ([FirmID], [CityID]) VALUES (1, 2)
INSERT [dbo].[City_link] ([FirmID], [CityID]) VALUES (2, 3)
INSERT [dbo].[City_link] ([FirmID], [CityID]) VALUES (3, 1)
INSERT [dbo].[City_link] ([FirmID], [CityID]) VALUES (4, 4)
SET IDENTITY_INSERT [dbo].[Count] ON 

INSERT [dbo].[Count] ([ID], [Count]) VALUES (1, 100)
INSERT [dbo].[Count] ([ID], [Count]) VALUES (2, 150)
INSERT [dbo].[Count] ([ID], [Count]) VALUES (3, 200)
INSERT [dbo].[Count] ([ID], [Count]) VALUES (4, 350)
INSERT [dbo].[Count] ([ID], [Count]) VALUES (5, 400)
SET IDENTITY_INSERT [dbo].[Count] OFF
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (1, 1)
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (2, 2)
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (3, 2)
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (4, 1)
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (6, 5)
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (7, 2)
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (8, 2)
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (9, 4)
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (10, 1)
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (11, 3)
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (12, 3)
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (13, 3)
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (14, 2)
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (15, 1)
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (16, 4)
INSERT [dbo].[Count_link] ([ProductID], [Count_ProductID]) VALUES (17, 2)
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([ID], [Name]) VALUES (1, N'Украина')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (2, N'Россия')
INSERT [dbo].[Country] ([ID], [Name]) VALUES (3, N'Япония')
SET IDENTITY_INSERT [dbo].[Country] OFF
INSERT [dbo].[Country_link] ([FirmID], [CountryID]) VALUES (1, 1)
INSERT [dbo].[Country_link] ([FirmID], [CountryID]) VALUES (2, 2)
INSERT [dbo].[Country_link] ([FirmID], [CountryID]) VALUES (3, 3)
INSERT [dbo].[Country_link] ([FirmID], [CountryID]) VALUES (4, 3)
SET IDENTITY_INSERT [dbo].[Date_of_receipt] ON 

INSERT [dbo].[Date_of_receipt] ([ID], [Date]) VALUES (1, CAST(N'2018-03-16' AS Date))
INSERT [dbo].[Date_of_receipt] ([ID], [Date]) VALUES (2, CAST(N'2018-03-17' AS Date))
INSERT [dbo].[Date_of_receipt] ([ID], [Date]) VALUES (3, CAST(N'2018-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Date_of_receipt] OFF
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (1, 1)
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (1, 2)
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (3, 3)
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (4, 3)
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (6, 3)
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (7, 3)
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (8, 1)
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (9, 1)
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (10, 2)
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (11, 2)
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (12, 2)
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (13, 1)
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (14, 3)
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (15, 3)
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (16, 3)
INSERT [dbo].[Date_of_receipt_link] ([ProductID], [Date_receiptID]) VALUES (17, 3)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (1, 1)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (2, 1)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (3, 1)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (4, 1)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (6, 2)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (7, 2)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (8, 2)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (9, 2)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (10, 3)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (11, 3)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (12, 3)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (13, 3)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (14, 4)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (15, 4)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (16, 4)
INSERT [dbo].[Fio_link] ([ProductID], [FioID]) VALUES (17, 4)
SET IDENTITY_INSERT [dbo].[FIO_Person] ON 

INSERT [dbo].[FIO_Person] ([ID], [Name], [Surname]) VALUES (1, N'Петя', N'Петров')
INSERT [dbo].[FIO_Person] ([ID], [Name], [Surname]) VALUES (2, N'Вася', N'Пяточкин')
INSERT [dbo].[FIO_Person] ([ID], [Name], [Surname]) VALUES (3, N'Хирукама', N'Нисизаки')
INSERT [dbo].[FIO_Person] ([ID], [Name], [Surname]) VALUES (4, N'Лиглус', N'Олукчар')
SET IDENTITY_INSERT [dbo].[FIO_Person] OFF
SET IDENTITY_INSERT [dbo].[Firm] ON 

INSERT [dbo].[Firm] ([ID], [Name]) VALUES (1, N'ООО "Сельхоз"')
INSERT [dbo].[Firm] ([ID], [Name]) VALUES (2, N'ООО "Батька"')
INSERT [dbo].[Firm] ([ID], [Name]) VALUES (3, N'ООО "Чуб"')
INSERT [dbo].[Firm] ([ID], [Name]) VALUES (4, N'ООО "Цент"')
SET IDENTITY_INSERT [dbo].[Firm] OFF
SET IDENTITY_INSERT [dbo].[Mark_up] ON 

INSERT [dbo].[Mark_up] ([ID], [Count]) VALUES (1, 15.0000)
INSERT [dbo].[Mark_up] ([ID], [Count]) VALUES (2, 20.0000)
INSERT [dbo].[Mark_up] ([ID], [Count]) VALUES (3, 5.0000)
INSERT [dbo].[Mark_up] ([ID], [Count]) VALUES (4, 9.0000)
SET IDENTITY_INSERT [dbo].[Mark_up] OFF
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (1, 1)
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (2, 4)
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (3, 2)
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (4, 4)
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (6, 4)
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (7, 4)
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (8, 2)
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (9, 1)
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (10, 2)
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (11, 3)
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (12, 3)
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (13, 3)
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (14, 2)
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (15, 1)
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (16, 4)
INSERT [dbo].[Mark_up_link] ([ProductID], [Mark_up]) VALUES (17, 3)
SET IDENTITY_INSERT [dbo].[Phone] ON 

INSERT [dbo].[Phone] ([ID], [FirmID], [Number]) VALUES (1, 1, N'+000')
INSERT [dbo].[Phone] ([ID], [FirmID], [Number]) VALUES (2, 2, N'+001')
INSERT [dbo].[Phone] ([ID], [FirmID], [Number]) VALUES (3, 3, N'+002')
INSERT [dbo].[Phone] ([ID], [FirmID], [Number]) VALUES (4, 4, N'+003')
SET IDENTITY_INSERT [dbo].[Phone] OFF
SET IDENTITY_INSERT [dbo].[Price] ON 

INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (1, 1, 28.0000)
INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (2, 2, 32.0000)
INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (3, 3, 15.0000)
INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (4, 4, 21.0000)
INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (7, 6, 18.0000)
INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (8, 7, 28.0000)
INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (9, 8, 11.0000)
INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (10, 9, 90.0000)
INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (11, 10, 37.0000)
INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (12, 11, 38.0000)
INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (13, 12, 50.0000)
INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (14, 13, 42.0000)
INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (15, 14, 100.0000)
INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (16, 15, 23.0000)
INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (17, 16, 66.0000)
INSERT [dbo].[Price] ([ID], [ProductID], [Price]) VALUES (18, 17, 100.0000)
SET IDENTITY_INSERT [dbo].[Price] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (1, N'Яблоко "Семеринка"', 1)
INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (2, N'Груша "Росса"', 1)
INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (3, N'Леденец "NANI?"', 1)
INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (4, N'Батарейки "Кобылка"', 1)
INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (6, N'Яблоко "Чемпион"', 2)
INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (7, N'Груша "Зоря"', 2)
INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (8, N'Леденец "OMAIVA"', 2)
INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (9, N'Батарейки "Пчела"', 2)
INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (10, N'Яблоко "Солнце"', 3)
INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (11, N'Груша "Букет"', 3)
INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (12, N'Леденец "HINDE RY" ', 3)
INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (13, N'Батарейка "Юла"', 3)
INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (14, N'Яблоко "Волчица"', 4)
INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (15, N'Груша "Пряность"', 4)
INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (16, N'Леденец "Злото"', 4)
INSERT [dbo].[Product] ([ID], [Name], [FirmID]) VALUES (17, N'Батарейка "Пастушка"', 4)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Product_category] ON 

INSERT [dbo].[Product_category] ([ID], [Сategory]) VALUES (1, N'Овощи')
INSERT [dbo].[Product_category] ([ID], [Сategory]) VALUES (2, N'Фрукты')
INSERT [dbo].[Product_category] ([ID], [Сategory]) VALUES (3, N'Кондитерское')
INSERT [dbo].[Product_category] ([ID], [Сategory]) VALUES (4, N'Техника')
SET IDENTITY_INSERT [dbo].[Product_category] OFF
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (1, 2)
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (2, 1)
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (3, 3)
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (4, 4)
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (6, 2)
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (7, 1)
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (8, 3)
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (9, 4)
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (10, 2)
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (11, 1)
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (12, 3)
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (13, 4)
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (14, 2)
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (15, 1)
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (16, 3)
INSERT [dbo].[Product_category_link] ([ProductID], [CategoryID]) VALUES (17, 4)
SET IDENTITY_INSERT [dbo].[Product_life] ON 

INSERT [dbo].[Product_life] ([ID], [Date]) VALUES (1, CAST(N'2025-01-01' AS Date))
INSERT [dbo].[Product_life] ([ID], [Date]) VALUES (2, CAST(N'2018-04-01' AS Date))
INSERT [dbo].[Product_life] ([ID], [Date]) VALUES (3, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[Product_life] ([ID], [Date]) VALUES (4, CAST(N'2020-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Product_life] OFF
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (1, 2)
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (2, 2)
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (3, 4)
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (4, 1)
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (6, 3)
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (7, 3)
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (8, 4)
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (9, 1)
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (10, 3)
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (11, 2)
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (12, 4)
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (13, 1)
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (14, 2)
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (15, 3)
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (16, 2)
INSERT [dbo].[Product_life_link] ([ProductID], [DateID]) VALUES (17, 1)
INSERT [dbo].[Вoss_link] ([FirmID], [BossID]) VALUES (1, 1)
INSERT [dbo].[Вoss_link] ([FirmID], [BossID]) VALUES (1, 2)
INSERT [dbo].[Вoss_link] ([FirmID], [BossID]) VALUES (2, 3)
INSERT [dbo].[Вoss_link] ([FirmID], [BossID]) VALUES (3, 4)
INSERT [dbo].[Вoss_link] ([FirmID], [BossID]) VALUES (4, 5)
ALTER TABLE [dbo].[Adressa_link]  WITH CHECK ADD  CONSTRAINT [FK_Adressa_link_Adressa] FOREIGN KEY([AdressaID])
REFERENCES [dbo].[Adressa] ([ID])
GO
ALTER TABLE [dbo].[Adressa_link] CHECK CONSTRAINT [FK_Adressa_link_Adressa]
GO
ALTER TABLE [dbo].[Adressa_link]  WITH CHECK ADD  CONSTRAINT [FK_Adressa_link_Firm] FOREIGN KEY([FirmID])
REFERENCES [dbo].[Firm] ([ID])
GO
ALTER TABLE [dbo].[Adressa_link] CHECK CONSTRAINT [FK_Adressa_link_Firm]
GO
ALTER TABLE [dbo].[City_link]  WITH CHECK ADD  CONSTRAINT [FK_City_link_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[City_link] CHECK CONSTRAINT [FK_City_link_City]
GO
ALTER TABLE [dbo].[City_link]  WITH CHECK ADD  CONSTRAINT [FK_City_link_Firm] FOREIGN KEY([FirmID])
REFERENCES [dbo].[Firm] ([ID])
GO
ALTER TABLE [dbo].[City_link] CHECK CONSTRAINT [FK_City_link_Firm]
GO
ALTER TABLE [dbo].[Count_link]  WITH CHECK ADD  CONSTRAINT [FK_Count_link_Count] FOREIGN KEY([Count_ProductID])
REFERENCES [dbo].[Count] ([ID])
GO
ALTER TABLE [dbo].[Count_link] CHECK CONSTRAINT [FK_Count_link_Count]
GO
ALTER TABLE [dbo].[Count_link]  WITH CHECK ADD  CONSTRAINT [FK_Count_link_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Count_link] CHECK CONSTRAINT [FK_Count_link_Product]
GO
ALTER TABLE [dbo].[Country_link]  WITH CHECK ADD  CONSTRAINT [FK_Country_link_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[Country_link] CHECK CONSTRAINT [FK_Country_link_Country]
GO
ALTER TABLE [dbo].[Country_link]  WITH CHECK ADD  CONSTRAINT [FK_Country_link_Firm] FOREIGN KEY([FirmID])
REFERENCES [dbo].[Firm] ([ID])
GO
ALTER TABLE [dbo].[Country_link] CHECK CONSTRAINT [FK_Country_link_Firm]
GO
ALTER TABLE [dbo].[Date_of_receipt_link]  WITH CHECK ADD  CONSTRAINT [FK_Date_of_receipt_link_Date_of_receipt] FOREIGN KEY([Date_receiptID])
REFERENCES [dbo].[Date_of_receipt] ([ID])
GO
ALTER TABLE [dbo].[Date_of_receipt_link] CHECK CONSTRAINT [FK_Date_of_receipt_link_Date_of_receipt]
GO
ALTER TABLE [dbo].[Date_of_receipt_link]  WITH CHECK ADD  CONSTRAINT [FK_Date_of_receipt_link_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Date_of_receipt_link] CHECK CONSTRAINT [FK_Date_of_receipt_link_Product]
GO
ALTER TABLE [dbo].[Fio_link]  WITH CHECK ADD  CONSTRAINT [FK_Fio_link_FIO_Person] FOREIGN KEY([FioID])
REFERENCES [dbo].[FIO_Person] ([ID])
GO
ALTER TABLE [dbo].[Fio_link] CHECK CONSTRAINT [FK_Fio_link_FIO_Person]
GO
ALTER TABLE [dbo].[Fio_link]  WITH CHECK ADD  CONSTRAINT [FK_Fio_link_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Fio_link] CHECK CONSTRAINT [FK_Fio_link_Product]
GO
ALTER TABLE [dbo].[Mark_up_link]  WITH CHECK ADD  CONSTRAINT [FK_Mark_up_link_Mark_up] FOREIGN KEY([Mark_up])
REFERENCES [dbo].[Mark_up] ([ID])
GO
ALTER TABLE [dbo].[Mark_up_link] CHECK CONSTRAINT [FK_Mark_up_link_Mark_up]
GO
ALTER TABLE [dbo].[Mark_up_link]  WITH CHECK ADD  CONSTRAINT [FK_Mark_up_link_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Mark_up_link] CHECK CONSTRAINT [FK_Mark_up_link_Product]
GO
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_Firm] FOREIGN KEY([FirmID])
REFERENCES [dbo].[Firm] ([ID])
GO
ALTER TABLE [dbo].[Phone] CHECK CONSTRAINT [FK_Phone_Firm]
GO
ALTER TABLE [dbo].[Price]  WITH CHECK ADD  CONSTRAINT [FK_Price_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Price] CHECK CONSTRAINT [FK_Price_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Firm] FOREIGN KEY([FirmID])
REFERENCES [dbo].[Firm] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Firm]
GO
ALTER TABLE [dbo].[Product_category_link]  WITH CHECK ADD  CONSTRAINT [FK_Product_category_link_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Product_category_link] CHECK CONSTRAINT [FK_Product_category_link_Product]
GO
ALTER TABLE [dbo].[Product_category_link]  WITH CHECK ADD  CONSTRAINT [FK_Product_category_link_Product_category1] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Product_category] ([ID])
GO
ALTER TABLE [dbo].[Product_category_link] CHECK CONSTRAINT [FK_Product_category_link_Product_category1]
GO
ALTER TABLE [dbo].[Product_life_link]  WITH CHECK ADD  CONSTRAINT [FK_Product_life_link_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Product_life_link] CHECK CONSTRAINT [FK_Product_life_link_Product]
GO
ALTER TABLE [dbo].[Product_life_link]  WITH CHECK ADD  CONSTRAINT [FK_Product_life_link_Product_life] FOREIGN KEY([DateID])
REFERENCES [dbo].[Product_life] ([ID])
GO
ALTER TABLE [dbo].[Product_life_link] CHECK CONSTRAINT [FK_Product_life_link_Product_life]
GO
ALTER TABLE [dbo].[Вoss_link]  WITH CHECK ADD  CONSTRAINT [FK_Вoss_link_Boss] FOREIGN KEY([BossID])
REFERENCES [dbo].[Boss] ([ID])
GO
ALTER TABLE [dbo].[Вoss_link] CHECK CONSTRAINT [FK_Вoss_link_Boss]
GO
ALTER TABLE [dbo].[Вoss_link]  WITH CHECK ADD  CONSTRAINT [FK_Вoss_link_Firm] FOREIGN KEY([FirmID])
REFERENCES [dbo].[Firm] ([ID])
GO
ALTER TABLE [dbo].[Вoss_link] CHECK CONSTRAINT [FK_Вoss_link_Firm]
GO
USE [master]
GO
ALTER DATABASE [Supermarket_warehouse] SET  READ_WRITE 
GO
