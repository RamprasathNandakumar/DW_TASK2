USE [master]
GO
/****** Object:  Database [DataWarehouseTask2]    Script Date: 18/02/2019 4:38:32 AM ******/
CREATE DATABASE [DataWarehouseTask2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataWarehouseTask2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DataWarehouseTask2.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DataWarehouseTask2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DataWarehouseTask2_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DataWarehouseTask2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataWarehouseTask2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DataWarehouseTask2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET ARITHABORT OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DataWarehouseTask2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DataWarehouseTask2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DataWarehouseTask2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DataWarehouseTask2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET RECOVERY FULL 
GO
ALTER DATABASE [DataWarehouseTask2] SET  MULTI_USER 
GO
ALTER DATABASE [DataWarehouseTask2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DataWarehouseTask2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DataWarehouseTask2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DataWarehouseTask2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DataWarehouseTask2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DataWarehouseTask2', N'ON'
GO
ALTER DATABASE [DataWarehouseTask2] SET QUERY_STORE = OFF
GO
USE [DataWarehouseTask2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [DataWarehouseTask2]
GO
/****** Object:  Table [dbo].[DimSuburb]    Script Date: 18/02/2019 4:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSuburb](
	[Suburb_Id] [int] NOT NULL,
	[Suburb] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DimSuburb] PRIMARY KEY CLUSTERED 
(
	[Suburb_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactTable]    Script Date: 18/02/2019 4:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTable](
	[Fact_Id] [int] NOT NULL,
	[Suburb] [nvarchar](max) NULL,
	[Postcode] [int] NULL,
	[Updated_Year] [int] NULL,
	[Updated_Month] [int] NULL,
	[Train_Station_Name_Id] [int] NULL,
	[school_code] [int] NULL,
	[Suburb_Id] [int] NULL,
	[Train_Station_Id] [int] NULL,
	[PMV_Postcode.PostCode_Id] [int] NULL,
 CONSTRAINT [PK_FactTable] PRIMARY KEY CLUSTERED 
(
	[Fact_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postcode]    Script Date: 18/02/2019 4:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postcode](
	[Postcode_Id] [int] NOT NULL,
	[Postcode] [int] NOT NULL,
	[Avg_PMV_By_Postcode] [money] NULL,
 CONSTRAINT [PK_Postcode] PRIMARY KEY CLUSTERED 
(
	[Postcode_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 18/02/2019 4:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[Property_Id] [int] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Suburb] [nvarchar](max) NOT NULL,
	[City] [nvarchar](255) NOT NULL,
	[State] [nvarchar](255) NULL,
	[StateCode] [nvarchar](25) NULL,
	[Property_Median_Value] [money] NULL,
	[Postcode] [int] NULL,
	[Updated_Year] [int] NULL,
	[Updated_Month] [int] NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[Property_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PublicSchoolsList]    Script Date: 18/02/2019 4:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublicSchoolsList](
	[School_Code] [smallint] NOT NULL,
	[AgeID] [int] NULL,
	[School_Name] [nvarchar](max) NULL,
	[Street] [nvarchar](max) NULL,
	[Town_Suburb] [nvarchar](max) NULL,
	[Postcode] [int] NULL,
	[Student_Number] [int] NULL,
	[indigenous_pct] [nvarchar](255) NULL,
	[lbote_pct] [int] NULL,
	[Level_Of_Schooling] [nvarchar](max) NULL,
	[ICSEAValue] [int] NULL,
	[Selective_School] [nvarchar](255) NULL,
	[Opportunity_Class] [nvarchar](255) NULL,
	[School_SpecialityType] [nvarchar](255) NULL,
	[School_Subtype] [nvarchar](max) NULL,
	[Preschool_Ind] [nvarchar](255) NULL,
	[Support_Class] [nvarchar](5) NULL,
	[Distance_Education] [nvarchar](255) NULL,
	[Intensive_English_Center] [nvarchar](5) NULL,
	[School_Gender] [nvarchar](25) NULL,
	[phone] [nvarchar](255) NULL,
	[School_Email] [nvarchar](max) NULL,
	[Fax] [nvarchar](255) NULL,
	[Late_Opening_School] [nvarchar](5) NULL,
	[Date_1st_Teacher] [nvarchar](255) NULL,
	[Iga] [nvarchar](255) NULL,
	[Electorate] [nvarchar](255) NULL,
	[Fed_Electorate] [nvarchar](255) NULL,
	[Operational_Directorate] [nvarchar](255) NULL,
	[Principal_Network] [nvarchar](255) NULL,
	[Facs_District] [nvarchar](255) NULL,
	[Local_Health_District] [nvarchar](255) NULL,
	[AECG_Region] [nvarchar](255) NULL,
	[ASGS_Remoteness] [nvarchar](255) NULL,
	[SchoolLatitude] [decimal](10, 7) NULL,
	[SchoolLongitude] [decimal](10, 7) NULL,
	[Date_Extracted] [date] NULL,
 CONSTRAINT [PK_PublicSchoolsList_SchoolID] PRIMARY KEY CLUSTERED 
(
	[School_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainEntrance]    Script Date: 18/02/2019 4:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainEntrance](
	[Entrance_ID] [int] NOT NULL,
	[Entrance_Type] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TrainEntrance] PRIMARY KEY CLUSTERED 
(
	[Entrance_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainStationSuburb]    Script Date: 18/02/2019 4:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainStationSuburb](
	[TrainStation_Id] [int] NOT NULL,
	[Train_Station] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TrainStationSuburb] PRIMARY KEY CLUSTERED 
(
	[TrainStation_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainStop]    Script Date: 18/02/2019 4:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainStop](
	[Train_Station_Name_Id] [int] NOT NULL,
	[Train_Station_Name] [nvarchar](max) NOT NULL,
	[Train_Station] [nvarchar](max) NOT NULL,
	[Street_Name] [nvarchar](max) NULL,
	[Street_Type] [nvarchar](max) NULL,
	[Entrance_Type] [nvarchar](max) NULL,
	[StationLatitude] [decimal](9, 6) NULL,
	[StationLongitude] [decimal](9, 6) NULL,
	[Exit_Number] [nvarchar](max) NULL,
 CONSTRAINT [PK_TrainStop] PRIMARY KEY CLUSTERED 
(
	[Train_Station_Name_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactTable]  WITH CHECK ADD  CONSTRAINT [FK_DimSuburb] FOREIGN KEY([Suburb_Id])
REFERENCES [dbo].[DimSuburb] ([Suburb_Id])
GO
ALTER TABLE [dbo].[FactTable] CHECK CONSTRAINT [FK_DimSuburb]
GO
ALTER TABLE [dbo].[FactTable]  WITH CHECK ADD  CONSTRAINT [FK_Suburb_Id] FOREIGN KEY([Suburb_Id])
REFERENCES [dbo].[DimSuburb] ([Suburb_Id])
GO
ALTER TABLE [dbo].[FactTable] CHECK CONSTRAINT [FK_Suburb_Id]
GO
ALTER TABLE [dbo].[FactTable]  WITH CHECK ADD  CONSTRAINT [FK_TrainStop] FOREIGN KEY([Train_Station_Name_Id])
REFERENCES [dbo].[TrainStop] ([Train_Station_Name_Id])
GO
ALTER TABLE [dbo].[FactTable] CHECK CONSTRAINT [FK_TrainStop]
GO
USE [master]
GO
ALTER DATABASE [DataWarehouseTask2] SET  READ_WRITE 
GO
