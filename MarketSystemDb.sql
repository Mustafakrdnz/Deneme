USE [master]
GO
/****** Object:  Database [MarketSystemDb]    Script Date: 29.03.2024 12:02:14 ******/
CREATE DATABASE [MarketSystemDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MarketSystemDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MarketSystemDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MarketSystemDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MarketSystemDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MarketSystemDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MarketSystemDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MarketSystemDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MarketSystemDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MarketSystemDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MarketSystemDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MarketSystemDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [MarketSystemDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MarketSystemDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MarketSystemDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MarketSystemDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MarketSystemDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MarketSystemDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MarketSystemDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MarketSystemDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MarketSystemDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MarketSystemDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MarketSystemDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MarketSystemDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MarketSystemDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MarketSystemDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MarketSystemDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MarketSystemDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MarketSystemDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MarketSystemDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MarketSystemDb] SET  MULTI_USER 
GO
ALTER DATABASE [MarketSystemDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MarketSystemDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MarketSystemDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MarketSystemDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MarketSystemDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MarketSystemDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MarketSystemDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [MarketSystemDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MarketSystemDb]
GO
/****** Object:  Table [dbo].[Buy]    Script Date: 29.03.2024 12:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 29.03.2024 12:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
	[IsStatus] [bit] NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 29.03.2024 12:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[IsStatus] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CategoryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sell]    Script Date: 29.03.2024 12:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sell](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 29.03.2024 12:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((1)) FOR [IsStatus]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [IsStatus]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Stock] ADD  DEFAULT ((0)) FOR [Stock]
GO
USE [master]
GO
ALTER DATABASE [MarketSystemDb] SET  READ_WRITE 
GO
