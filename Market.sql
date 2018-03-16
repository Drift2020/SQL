USE [master]
GO
/****** Object:  Database [Supermarket_warehouse]    Script Date: 16.03.2018 16:08:23 ******/
CREATE DATABASE [Supermarket_warehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Supermarket_warehouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Supermarket_warehouse.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Supermarket_warehouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Supermarket_warehouse_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [Supermarket_warehouse] SET AUTO_CREATE_STATISTICS ON 
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
EXEC sys.sp_db_vardecimal_storage_format N'Supermarket_warehouse', N'ON'
GO
USE [Supermarket_warehouse]
GO
/****** Object:  Table [dbo].[Adressa]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Adressa_link]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Boss]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[City]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[City_link]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Count]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Count_link]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Country]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Country_link]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Date_of_receipt]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Date_of_receipt_link]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Fio_link]    Script Date: 16.03.2018 16:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fio_link](
	[ProductID] [int] NOT NULL,
	[FioID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FIO_Person]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Firm]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Mark_up]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Mark_up_link]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Phone]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Price]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Product_category]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Product_category_link]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Product_life]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Product_life_link]    Script Date: 16.03.2018 16:08:24 ******/
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
/****** Object:  Table [dbo].[Вoss_link]    Script Date: 16.03.2018 16:08:24 ******/
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
