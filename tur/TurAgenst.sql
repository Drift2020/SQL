USE [master]
GO
/****** Object:  Database [Tourist_agency]    Script Date: 21.03.2018 16:20:22 ******/
CREATE DATABASE [Tourist_agency]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tourist_agency', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Tourist_agency.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[Accountant_Resorts_link]    Script Date: 21.03.2018 16:20:23 ******/
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
/****** Object:  Table [dbo].[City]    Script Date: 21.03.2018 16:20:23 ******/
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
/****** Object:  Table [dbo].[Country]    Script Date: 21.03.2018 16:20:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country_City_link]    Script Date: 21.03.2018 16:20:23 ******/
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
/****** Object:  Table [dbo].[Employees]    Script Date: 21.03.2018 16:20:23 ******/
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
/****** Object:  Table [dbo].[Hotels]    Script Date: 21.03.2018 16:20:23 ******/
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
/****** Object:  Table [dbo].[Hotels_Resorts_link]    Script Date: 21.03.2018 16:20:23 ******/
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
/****** Object:  Table [dbo].[Manager_Resortsl_link]    Script Date: 21.03.2018 16:20:23 ******/
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
/****** Object:  Table [dbo].[People]    Script Date: 21.03.2018 16:20:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Surname] [nvarchar](255) NOT NULL,
	[Date_out] [date] NOT NULL,
	[ResortsID] [int] NOT NULL,
	[Time_of_TourismID] [int] NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Price_for_Hotels]    Script Date: 21.03.2018 16:20:23 ******/
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
/****** Object:  Table [dbo].[Price_for_Transport]    Script Date: 21.03.2018 16:20:23 ******/
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
/****** Object:  Table [dbo].[Price_for_Types_of_rest]    Script Date: 21.03.2018 16:20:23 ******/
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
/****** Object:  Table [dbo].[Resorts]    Script Date: 21.03.2018 16:20:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resorts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CountryID] [int] NOT NULL,
	[Price_for_tourismID] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resortsl_Director_link]    Script Date: 21.03.2018 16:20:23 ******/
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
/****** Object:  Table [dbo].[Time_of_Hotel]    Script Date: 21.03.2018 16:20:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time_of_Hotel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Start] [date] NOT NULL,
	[End] [date] NOT NULL,
	[MoneyID] [int] NOT NULL,
 CONSTRAINT [PK_Time_of_Hotel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Time_of_Types_of_rest]    Script Date: 21.03.2018 16:20:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time_of_Types_of_rest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Start] [date] NOT NULL,
	[End] [date] NOT NULL,
	[MoneyID] [int] NOT NULL,
 CONSTRAINT [PK_Time_of_Tourism] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transport_Resorts_link]    Script Date: 21.03.2018 16:20:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transport_Resorts_link](
	[TransportID] [int] NOT NULL,
	[ResortsID] [int] NOT NULL,
 CONSTRAINT [PK_Transport_Resorts_link] PRIMARY KEY CLUSTERED 
(
	[TransportID] ASC,
	[ResortsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types_of_rest]    Script Date: 21.03.2018 16:20:23 ******/
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
/****** Object:  Table [dbo].[Types_of_rest_Resortsl_Link]    Script Date: 21.03.2018 16:20:23 ******/
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
/****** Object:  Table [dbo].[Types_of_transport]    Script Date: 21.03.2018 16:20:23 ******/
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
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Resorts] FOREIGN KEY([ResortsID])
REFERENCES [dbo].[Resorts] ([ID])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Resorts]
GO
ALTER TABLE [dbo].[Resorts]  WITH CHECK ADD  CONSTRAINT [FK_Resorts_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[Resorts] CHECK CONSTRAINT [FK_Resorts_Country]
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
ALTER TABLE [dbo].[Transport_Resorts_link]  WITH CHECK ADD  CONSTRAINT [FK_Transport_Resorts_link_Resorts] FOREIGN KEY([ResortsID])
REFERENCES [dbo].[Resorts] ([ID])
GO
ALTER TABLE [dbo].[Transport_Resorts_link] CHECK CONSTRAINT [FK_Transport_Resorts_link_Resorts]
GO
ALTER TABLE [dbo].[Transport_Resorts_link]  WITH CHECK ADD  CONSTRAINT [FK_Transport_Resorts_link_Types_of_transport] FOREIGN KEY([TransportID])
REFERENCES [dbo].[Types_of_transport] ([ID])
GO
ALTER TABLE [dbo].[Transport_Resorts_link] CHECK CONSTRAINT [FK_Transport_Resorts_link_Types_of_transport]
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
