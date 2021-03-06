USE [master]
GO
/****** Object:  Database [Supermarket_warehouse]    Script Date: 15.03.2018 16:14:21 ******/
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
ALTER DATABASE [Supermarket_warehouse] SET  READ_WRITE 
GO
