USE [master]
GO
/****** Object:  Database [Store_Diagram]    Script Date: 23.07.2023 20:28:17 ******/
CREATE DATABASE [Store_Diagram]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Store_Diagram', FILENAME = N'D:\SQL Management ШАГ\Store_Diagram\Store_Diagram.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Store_Diagram_log', FILENAME = N'D:\SQL Management ШАГ\Store_Diagram\Store_Diagram_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Store_Diagram] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Store_Diagram].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Store_Diagram] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Store_Diagram] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Store_Diagram] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Store_Diagram] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Store_Diagram] SET ARITHABORT OFF 
GO
ALTER DATABASE [Store_Diagram] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Store_Diagram] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Store_Diagram] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Store_Diagram] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Store_Diagram] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Store_Diagram] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Store_Diagram] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Store_Diagram] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Store_Diagram] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Store_Diagram] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Store_Diagram] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Store_Diagram] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Store_Diagram] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Store_Diagram] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Store_Diagram] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Store_Diagram] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Store_Diagram] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Store_Diagram] SET RECOVERY FULL 
GO
ALTER DATABASE [Store_Diagram] SET  MULTI_USER 
GO
ALTER DATABASE [Store_Diagram] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Store_Diagram] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Store_Diagram] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Store_Diagram] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Store_Diagram] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Store_Diagram] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Store_Diagram', N'ON'
GO
ALTER DATABASE [Store_Diagram] SET QUERY_STORE = ON
GO
ALTER DATABASE [Store_Diagram] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Store_Diagram]
GO
/****** Object:  Table [dbo].[Address_Table]    Script Date: 23.07.2023 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address_Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](50) NULL,
	[id_city] [int] NULL,
 CONSTRAINT [PK_Address_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_Table]    Script Date: 23.07.2023 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City_Table]    Script Date: 23.07.2023 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City_Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_region] [int] NULL,
 CONSTRAINT [PK_City_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country_Table]    Script Date: 23.07.2023 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country_Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery_Table]    Script Date: 23.07.2023 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery_Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[id_supplier] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_delivery] [date] NULL,
 CONSTRAINT [PK_Delivery_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Markup_Table]    Script Date: 23.07.2023 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markup_Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[percent] [int] NULL,
 CONSTRAINT [PK_Markup_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurement_Table]    Script Date: 23.07.2023 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement_Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](70) NULL,
 CONSTRAINT [PK_Measurement_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer_Table]    Script Date: 23.07.2023 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer_Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Producer_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Table]    Script Date: 23.07.2023 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_category] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[id_producer] [int] NULL,
	[id_measurement] [int] NULL,
	[id_markup] [int] NULL,
 CONSTRAINT [PK_Product_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region_Table]    Script Date: 23.07.2023 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region_Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_country] [int] NULL,
 CONSTRAINT [PK_Region_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale_Table]    Script Date: 23.07.2023 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale_Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_sale] [date] NULL,
 CONSTRAINT [PK_Sale_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier_Table]    Script Date: 23.07.2023 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier_Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Supplier_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address_Table]  WITH CHECK ADD  CONSTRAINT [FK_Address_Table_City_Table] FOREIGN KEY([id_city])
REFERENCES [dbo].[City_Table] ([ID])
GO
ALTER TABLE [dbo].[Address_Table] CHECK CONSTRAINT [FK_Address_Table_City_Table]
GO
ALTER TABLE [dbo].[City_Table]  WITH CHECK ADD  CONSTRAINT [FK_City_Table_Region_Table] FOREIGN KEY([id_region])
REFERENCES [dbo].[Region_Table] ([ID])
GO
ALTER TABLE [dbo].[City_Table] CHECK CONSTRAINT [FK_City_Table_Region_Table]
GO
ALTER TABLE [dbo].[Delivery_Table]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Table_Product_Table] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product_Table] ([ID])
GO
ALTER TABLE [dbo].[Delivery_Table] CHECK CONSTRAINT [FK_Delivery_Table_Product_Table]
GO
ALTER TABLE [dbo].[Delivery_Table]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Table_Supplier_Table] FOREIGN KEY([id_supplier])
REFERENCES [dbo].[Supplier_Table] ([ID])
GO
ALTER TABLE [dbo].[Delivery_Table] CHECK CONSTRAINT [FK_Delivery_Table_Supplier_Table]
GO
ALTER TABLE [dbo].[Producer_Table]  WITH CHECK ADD  CONSTRAINT [FK_Producer_Table_Address_Table] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address_Table] ([ID])
GO
ALTER TABLE [dbo].[Producer_Table] CHECK CONSTRAINT [FK_Producer_Table_Address_Table]
GO
ALTER TABLE [dbo].[Product_Table]  WITH CHECK ADD  CONSTRAINT [FK_Product_Table_Category_Table] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category_Table] ([ID])
GO
ALTER TABLE [dbo].[Product_Table] CHECK CONSTRAINT [FK_Product_Table_Category_Table]
GO
ALTER TABLE [dbo].[Product_Table]  WITH CHECK ADD  CONSTRAINT [FK_Product_Table_Markup_Table] FOREIGN KEY([id_markup])
REFERENCES [dbo].[Markup_Table] ([ID])
GO
ALTER TABLE [dbo].[Product_Table] CHECK CONSTRAINT [FK_Product_Table_Markup_Table]
GO
ALTER TABLE [dbo].[Product_Table]  WITH CHECK ADD  CONSTRAINT [FK_Product_Table_Measurement_Table] FOREIGN KEY([id_measurement])
REFERENCES [dbo].[Measurement_Table] ([ID])
GO
ALTER TABLE [dbo].[Product_Table] CHECK CONSTRAINT [FK_Product_Table_Measurement_Table]
GO
ALTER TABLE [dbo].[Product_Table]  WITH CHECK ADD  CONSTRAINT [FK_Product_Table_Producer_Table] FOREIGN KEY([id_producer])
REFERENCES [dbo].[Producer_Table] ([ID])
GO
ALTER TABLE [dbo].[Product_Table] CHECK CONSTRAINT [FK_Product_Table_Producer_Table]
GO
ALTER TABLE [dbo].[Region_Table]  WITH CHECK ADD  CONSTRAINT [FK_Region_Table_Country_Table] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country_Table] ([ID])
GO
ALTER TABLE [dbo].[Region_Table] CHECK CONSTRAINT [FK_Region_Table_Country_Table]
GO
ALTER TABLE [dbo].[Sale_Table]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Table_Product_Table] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product_Table] ([ID])
GO
ALTER TABLE [dbo].[Sale_Table] CHECK CONSTRAINT [FK_Sale_Table_Product_Table]
GO
ALTER TABLE [dbo].[Supplier_Table]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Table_Address_Table] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address_Table] ([ID])
GO
ALTER TABLE [dbo].[Supplier_Table] CHECK CONSTRAINT [FK_Supplier_Table_Address_Table]
GO
USE [master]
GO
ALTER DATABASE [Store_Diagram] SET  READ_WRITE 
GO
