USE [master]
GO
/****** Object:  Database [BABY_HEO]    Script Date: 6/13/2025 1:10:31 PM ******/
CREATE DATABASE [BABY_HEO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BABY_HEO', FILENAME = N'D:\Folder\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BABY_HEO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BABY_HEO_log', FILENAME = N'D:\Folder\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BABY_HEO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BABY_HEO] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BABY_HEO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BABY_HEO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BABY_HEO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BABY_HEO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BABY_HEO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BABY_HEO] SET ARITHABORT OFF 
GO
ALTER DATABASE [BABY_HEO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BABY_HEO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BABY_HEO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BABY_HEO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BABY_HEO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BABY_HEO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BABY_HEO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BABY_HEO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BABY_HEO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BABY_HEO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BABY_HEO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BABY_HEO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BABY_HEO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BABY_HEO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BABY_HEO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BABY_HEO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BABY_HEO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BABY_HEO] SET RECOVERY FULL 
GO
ALTER DATABASE [BABY_HEO] SET  MULTI_USER 
GO
ALTER DATABASE [BABY_HEO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BABY_HEO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BABY_HEO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BABY_HEO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BABY_HEO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BABY_HEO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BABY_HEO', N'ON'
GO
ALTER DATABASE [BABY_HEO] SET QUERY_STORE = ON
GO
ALTER DATABASE [BABY_HEO] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BABY_HEO]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 6/13/2025 1:10:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ADMIN_NAME] [varchar](50) NOT NULL,
	[USER_NAME] [varchar](50) NOT NULL,
	[PASSWORD] [varchar](20) NOT NULL,
	[ROLE] [int] NOT NULL,
	[CREATE_TIME] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 6/13/2025 1:10:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CATEGORY_NAME] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 6/13/2025 1:10:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[COLLECT_TIME] [date] NOT NULL,
	[NAME] [varchar](50) NULL,
	[PHONE] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 6/13/2025 1:10:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MENU_NAME] [varchar](100) NOT NULL,
	[CATEGORY_ID] [int] NULL,
	[PRICE] [int] NOT NULL,
	[IMAGE] [varchar](255) NULL,
	[STATUS] [int] NULL,
	[SALE] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER]    Script Date: 6/13/2025 1:10:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[COLLECT_TIME] [date] NOT NULL,
	[QUANTITY] [int] NOT NULL,
	[NAME] [varchar](50) NULL,
	[PHONE] [int] NOT NULL,
	[PRICE] [int] NOT NULL,
	[MENU_ID] [int] NOT NULL,
	[TABLE_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAY_OFF]    Script Date: 6/13/2025 1:10:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAY_OFF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[COLLECT_TIME] [date] NULL,
	[NAME] [varchar](50) NULL,
	[PHONE] [int] NULL,
	[PRICE] [int] NOT NULL,
	[TABLE_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAY_ONL]    Script Date: 6/13/2025 1:10:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAY_ONL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[COLLECT_TIME] [date] NOT NULL,
	[PRICE] [int] NOT NULL,
	[STATUS] [int] NULL,
	[TABLE_ID] [int] NULL,
	[ORDER_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QR]    Script Date: 6/13/2025 1:10:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QR_NAME] [varchar](255) NOT NULL,
	[TABLE_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TABLE]    Script Date: 6/13/2025 1:10:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TABLE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TABLE_NAME] [varchar](10) NULL,
	[CHAIR] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MENU]  WITH CHECK ADD  CONSTRAINT [FK_MENU_CATEGORY] FOREIGN KEY([CATEGORY_ID])
REFERENCES [dbo].[CATEGORY] ([ID])
GO
ALTER TABLE [dbo].[MENU] CHECK CONSTRAINT [FK_MENU_CATEGORY]
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_MENU] FOREIGN KEY([MENU_ID])
REFERENCES [dbo].[MENU] ([ID])
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [FK_ORDER_MENU]
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_TABLE] FOREIGN KEY([TABLE_ID])
REFERENCES [dbo].[TABLE] ([ID])
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [FK_ORDER_TABLE]
GO
ALTER TABLE [dbo].[PAY_OFF]  WITH CHECK ADD  CONSTRAINT [FK_PAY_OFF_TABLE] FOREIGN KEY([TABLE_ID])
REFERENCES [dbo].[TABLE] ([ID])
GO
ALTER TABLE [dbo].[PAY_OFF] CHECK CONSTRAINT [FK_PAY_OFF_TABLE]
GO
ALTER TABLE [dbo].[PAY_ONL]  WITH CHECK ADD  CONSTRAINT [FK_PAY_ONL_ORDER] FOREIGN KEY([ORDER_ID])
REFERENCES [dbo].[ORDER] ([ID])
GO
ALTER TABLE [dbo].[PAY_ONL] CHECK CONSTRAINT [FK_PAY_ONL_ORDER]
GO
ALTER TABLE [dbo].[PAY_ONL]  WITH CHECK ADD  CONSTRAINT [FK_PAY_ONL_TABLE] FOREIGN KEY([TABLE_ID])
REFERENCES [dbo].[TABLE] ([ID])
GO
ALTER TABLE [dbo].[PAY_ONL] CHECK CONSTRAINT [FK_PAY_ONL_TABLE]
GO
ALTER TABLE [dbo].[QR]  WITH CHECK ADD  CONSTRAINT [FK_QR_TABLE] FOREIGN KEY([TABLE_ID])
REFERENCES [dbo].[TABLE] ([ID])
GO
ALTER TABLE [dbo].[QR] CHECK CONSTRAINT [FK_QR_TABLE]
GO
USE [master]
GO
ALTER DATABASE [BABY_HEO] SET  READ_WRITE 
GO
