USE [master]
GO
/****** Object:  Database [HealthTracker]    Script Date: 13-Jan-17 1:56:26 AM ******/
CREATE DATABASE [HealthTracker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HealthTracker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\HealthTracker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HealthTracker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\HealthTracker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HealthTracker] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HealthTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HealthTracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HealthTracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HealthTracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HealthTracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HealthTracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [HealthTracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HealthTracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HealthTracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HealthTracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HealthTracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HealthTracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HealthTracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HealthTracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HealthTracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HealthTracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HealthTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HealthTracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HealthTracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HealthTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HealthTracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HealthTracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HealthTracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HealthTracker] SET RECOVERY FULL 
GO
ALTER DATABASE [HealthTracker] SET  MULTI_USER 
GO
ALTER DATABASE [HealthTracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HealthTracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HealthTracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HealthTracker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HealthTracker] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HealthTracker', N'ON'
GO
ALTER DATABASE [HealthTracker] SET QUERY_STORE = OFF
GO
USE [HealthTracker]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [HealthTracker]
GO
/****** Object:  User [krik88]    Script Date: 13-Jan-17 1:56:26 AM ******/
CREATE USER [krik88] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [UserRole]    Script Date: 13-Jan-17 1:56:26 AM ******/
CREATE ROLE [UserRole]
GO
/****** Object:  DatabaseRole [PharmacyRole]    Script Date: 13-Jan-17 1:56:26 AM ******/
CREATE ROLE [PharmacyRole]
GO
/****** Object:  DatabaseRole [DoctorRole]    Script Date: 13-Jan-17 1:56:26 AM ******/
CREATE ROLE [DoctorRole]
GO
ALTER ROLE [UserRole] ADD MEMBER [krik88]
GO
/****** Object:  Table [dbo].[Doctor_ActiveSubstance]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor_ActiveSubstance](
	[Doctor_Username] [varchar](20) NOT NULL,
	[ActiveSubstance_ID] [int] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Doctor_ActiveSubstance] PRIMARY KEY CLUSTERED 
(
	[Doctor_Username] ASC,
	[ActiveSubstance_ID] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Doctor_SelfView_Doctor_ActiveSubstance]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Doctor_SelfView_Doctor_ActiveSubstance] AS
SELECT *
FROM [dbo].[Doctor_ActiveSubstance]
WHERE Doctor_Username = SUSER_SNAME()
GO
/****** Object:  Table [dbo].[DoctorLocation]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorLocation](
	[username] [varchar](20) NOT NULL,
	[address] [varchar](30) NOT NULL,
	[city] [varchar](20) NOT NULL,
	[postcode] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Doctor_Location] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Doctor_SelfView_DoctorLocation]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Doctor_SelfView_DoctorLocation] AS
SELECT *
FROM [dbo].[DoctorLocation]
WHERE username = SUSER_SNAME()
GO
/****** Object:  Table [dbo].[Active Substance]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Active Substance](
	[ID] [int] NOT NULL,
	[title] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Active Substance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Drug]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drug](
	[ID] [int] NOT NULL,
	[title] [varchar](30) NOT NULL,
	[information] [varchar](150) NULL,
 CONSTRAINT [PK_Drug] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[name] [varchar](15) NOT NULL,
	[surname] [varchar](20) NOT NULL,
	[specialty] [varchar](30) NOT NULL,
	[phone] [char](10) NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Drug_ActiveSubstance]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drug_ActiveSubstance](
	[Drug_ID] [int] NOT NULL,
	[ActiveSubstance_ID] [int] NOT NULL,
 CONSTRAINT [PK_Drug_ActiveSubstance] PRIMARY KEY CLUSTERED 
(
	[Drug_ID] ASC,
	[ActiveSubstance_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Doctor_View_ActiveSubstanceOfDoctors]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Doctor_View_ActiveSubstanceOfDoctors] AS
SELECT D.name,D.surname,D.specialty,A.title AS ActiveSubstance, DR.title AS drug_name ,DA.date
FROM [dbo].[Doctor] D
JOIN [dbo].[Doctor_ActiveSubstance] DA
ON D.username=DA.Doctor_Username
JOIN [dbo].[Drug_ActiveSubstance] DRAC
ON DRAC.ActiveSubstance_ID=DA.ActiveSubstance_ID
JOIN [dbo].[Drug] DR
ON DR.ID=DRAC.Drug_ID
JOIN [dbo].[Active Substance] A
ON A.ID=DA.ActiveSubstance_ID
GO
/****** Object:  Table [dbo].[User_Disease]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Disease](
	[User_Username] [varchar](20) NOT NULL,
	[Disease_ID] [int] NOT NULL,
	[start_day] [date] NOT NULL,
	[end_day] [date] NULL,
 CONSTRAINT [PK_User_Disease] PRIMARY KEY CLUSTERED 
(
	[User_Username] ASC,
	[Disease_ID] ASC,
	[start_day] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Disease]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disease](
	[ID] [int] NOT NULL,
	[title] [varchar](30) NOT NULL,
	[information] [varchar](150) NULL,
 CONSTRAINT [PK_Disease] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserName]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserName](
	[username] [varchar](20) NOT NULL,
	[name] [varchar](15) NOT NULL,
	[surname] [varchar](20) NOT NULL,
 CONSTRAINT [PK_User_Name] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Doctor]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Doctor](
	[User_Username] [varchar](20) NOT NULL,
	[Doctor_Username] [varchar](20) NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_User_Doctor] PRIMARY KEY CLUSTERED 
(
	[User_Username] ASC,
	[Doctor_Username] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[username] [varchar](20) NOT NULL,
	[IID] [int] NOT NULL,
	[password] [varchar](20) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Doctor_View_Patients_Disease]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Doctor_View_Patients_Disease] AS
SELECT UN.name, UN.surname, U.IID, D.title, UD.start_day, UD.end_day
FROM [dbo].[User] U
JOIN [dbo].[User_Disease] UD
     ON U.username=UD.User_Username
JOIN [dbo].[Disease] D
     ON D.ID = UD.Disease_ID
JOIN [dbo].[UserName] UN
     ON UN.username = U.username
JOIN [dbo].[User_Doctor] UDOC
     ON U.username = UDOC.User_Username
WHERE UDOC.Doctor_Username = SUSER_NAME()

GO
/****** Object:  Table [dbo].[User_Drug]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Drug](
	[User_Username] [varchar](20) NOT NULL,
	[Drug_ID] [int] NOT NULL,
	[start_day] [date] NOT NULL,
	[end_day] [date] NULL,
 CONSTRAINT [PK_User_Drug] PRIMARY KEY CLUSTERED 
(
	[User_Username] ASC,
	[Drug_ID] ASC,
	[start_day] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Doctor_View_Patients_Drug]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Doctor_View_Patients_Drug] AS
SELECT UN.name, UN.surname, U.IID, D.title, UDR.start_day, UDR.end_day
FROM [dbo].[User] U
JOIN [dbo].[User_Drug] UDR
     ON U.username = UDR.User_Username
JOIN [dbo].[Drug] D
     ON D.ID = UDR.Drug_ID
JOIN [dbo].[UserName] UN
     ON UN.username = U.username
JOIN [dbo].[User_Doctor] UDOC
     ON U.username = UDOC.User_Username
WHERE UDOC.Doctor_Username = SUSER_NAME()

GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital](
	[ID] [int] NOT NULL,
	[title] [varchar](15) NOT NULL,
	[phone] [char](10) NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Hospital]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Hospital](
	[User_Username] [varchar](20) NOT NULL,
	[Hospital_ID] [int] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_User_Hospital] PRIMARY KEY CLUSTERED 
(
	[User_Username] ASC,
	[Hospital_ID] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Doctor_View_Patients_Hospital]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Doctor_View_Patients_Hospital] AS
SELECT UN.name, UN.surname, U.IID, H.title AS Hospital, UH.date
FROM [dbo].[User] U
JOIN [dbo].[User_Hospital] UH
     ON U.username = UH.User_Username
JOIN [dbo].[Hospital] H
     ON H.ID = UH.Hospital_ID
JOIN [dbo].[UserName] UN
     ON UN.username = U.username
JOIN [dbo].[User_Doctor] UDOC
     ON U.username = UDOC.User_Username
WHERE UDOC.Doctor_Username = SUSER_NAME()

GO
/****** Object:  Table [dbo].[Pharmacy]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacy](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[name] [varchar](15) NOT NULL,
	[surname] [varchar](20) NOT NULL,
	[working_hours] [varchar](100) NOT NULL,
	[phone] [char](10) NULL,
 CONSTRAINT [PK_Pharmacy] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Pharmacy_SelfView_Pharmacy]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Pharmacy_SelfView_Pharmacy] AS
SELECT *
FROM [dbo].[Pharmacy]
WHERE username = SUSER_SNAME()
GO
/****** Object:  Table [dbo].[PharmacyLocation]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyLocation](
	[username] [varchar](20) NOT NULL,
	[address] [varchar](30) NOT NULL,
	[city] [varchar](20) NOT NULL,
	[postcode] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Pharmacy-Location] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Pharmacy_SelfView_PharmacyLocation]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Pharmacy_SelfView_PharmacyLocation] AS
SELECT *
FROM [dbo].[PharmacyLocation]
WHERE username = SUSER_SNAME()
GO
/****** Object:  Table [dbo].[Pharmacy_Drug]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacy_Drug](
	[Pharmacy_Username] [varchar](20) NOT NULL,
	[Drug_ID] [int] NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_Pharmacy_Drug] PRIMARY KEY CLUSTERED 
(
	[Pharmacy_Username] ASC,
	[Drug_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Pharmacy_SelfView_PharmacyDrug]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Pharmacy_SelfView_PharmacyDrug] AS
SELECT PD.Pharmacy_Username,D.title,PD.Amount,D.information
FROM  [dbo].[Pharmacy_Drug] PD
JOIN [dbo].[Drug] D
    ON D.ID = PD.Drug_ID
WHERE Pharmacy_Username = SUSER_SNAME()
GO
/****** Object:  View [dbo].[Example_User_View]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Example_User_View] AS
SELECT username, IID
FROM [dbo].[User]

GO
/****** Object:  View [dbo].[Example_Doctor_View]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Example_Doctor_View] AS
SELECT username, name, surname, specialty, phone
FROM Doctor

GO
/****** Object:  View [dbo].[Example_Pharmacy_View]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Example_Pharmacy_View] AS
SELECT username, name, surname, working_hours, phone
FROM Pharmacy

GO
/****** Object:  View [dbo].[Example_UrologistThessaloniki_View]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Example_UrologistThessaloniki_View] AS
SELECT phone
FROM Doctor D JOIN DoctorLocation DL
ON D.username = DL.username
WHERE specialty = 'Ουρολόγος' AND city = 'Θεσσαλονίκη'

GO
/****** Object:  View [dbo].[User_View_User]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[User_View_User] AS
SELECT *
FROM [dbo].[User]
WHERE username = SUSER_SNAME()

GO
/****** Object:  View [dbo].[User_View_UserName]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[User_View_UserName] AS
SELECT *
FROM [dbo].[UserName]
WHERE username = SUSER_SNAME()
GO
/****** Object:  View [dbo].[User_View_User_Disease]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[User_View_User_Disease] AS
SELECT UD.User_Username,UD.start_day,UD.end_day,D.title
FROM [dbo].[User_Disease] UD
JOIN [dbo].[Disease] D
     ON D.ID = UD.Disease_ID
WHERE UD.User_Username = SUSER_SNAME()
GO
/****** Object:  View [dbo].[User_View_User_Doctor]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[User_View_User_Doctor] AS
SELECT UD.User_Username, D.name,D.surname,D.specialty,D.phone,UD.date
FROM [dbo].[User_Doctor] UD
JOIN [dbo].[Doctor] D
    ON UD.Doctor_Username=D.username
WHERE User_Username = SUSER_SNAME()
GO
/****** Object:  View [dbo].[User_View_User_Drug]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[User_View_User_Drug] AS
SELECT UD.User_Username,D.title,UD.start_day,UD.end_day,D.information
FROM User_Drug UD
JOIN Drug D
    ON D.ID = UD.Drug_ID
WHERE User_Username = SUSER_SNAME()
GO
/****** Object:  View [dbo].[User_View_User_Hospital]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[User_View_User_Hospital] AS
SELECT UH.User_Username,H.title,H.phone,UH.date
FROM User_Hospital UH
JOIN Hospital H  
    ON H.ID = UH.Hospital_ID
WHERE User_Username = SUSER_SNAME()
GO
/****** Object:  Table [dbo].[User_Pharmacy]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Pharmacy](
	[User_Username] [varchar](20) NOT NULL,
	[Pharmacy_Username] [varchar](20) NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_User_Pharmacy] PRIMARY KEY CLUSTERED 
(
	[User_Username] ASC,
	[Pharmacy_Username] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[User_View_User_Pharmacy]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[User_View_User_Pharmacy] AS
SELECT UP.User_Username,UP.date, P.name,P.surname,PL.address,PL.city,PL.postcode,P.working_hours,P.phone
FROM User_Pharmacy UP
JOIN  Pharmacy P
    ON P.username = UP.Pharmacy_Username
JOIN PharmacyLocation PL
    ON PL.username = UP.Pharmacy_Username
WHERE User_Username = SUSER_SNAME()
GO
/****** Object:  View [dbo].[View_DoctorLocation]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_DoctorLocation] AS
SELECT D.name,D.surname,D.specialty,DL.address,DL.city,DL.postcode,D.phone
FROM  Doctor D
JOIN DoctorLocation DL
    ON D.username=DL.username

GO
/****** Object:  Table [dbo].[HospitalLocation]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalLocation](
	[ID] [int] NOT NULL,
	[address] [varchar](30) NOT NULL,
	[city] [varchar](20) NOT NULL,
	[postcode] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Hospital_Location] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_HospitalLocation]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_HospitalLocation] AS
SELECT H.title,HL.address,HL.city,HL.postcode,H.phone
FROM  Hospital H
JOIN HospitalLocation HL
    ON H.ID = HL.ID
GO
/****** Object:  View [dbo].[View_PharmacyLocation]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_PharmacyLocation] AS
SELECT P.name,P.surname,PL.address,PL.city,PL.postcode,P.working_hours,P.phone
FROM  Pharmacy P
JOIN PharmacyLocation PL
    ON P.username = PL.username
GO
/****** Object:  View [dbo].[View_PharmacyDrug]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_PharmacyDrug] AS
SELECT D.title,PD.Amount,D.information,P.name,P.surname,PL.address,PL.city,PL.postcode,P.working_hours,P.phone
FROM  Pharmacy P
JOIN Pharmacy_Drug PD
    ON P.username = PD.Pharmacy_Username
JOIn Drug D
    ON D.ID=PD.Drug_ID
JOIN PharmacyLocation PL
    ON P.username = PL.username

GO
/****** Object:  View [dbo].[View_ActiveSubstance]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ActiveSubstance] AS
SELECT ACS.title,D.information,D.title AS DrugTitle
FROM [Active Substance] ACS
 JOIN Drug_ActiveSubstance DA
    ON DA.ActiveSubstance_ID = ACS.ID
JOIN Drug D
    ON D.ID = DA.Drug_ID
GO
/****** Object:  View [dbo].[View_Disease]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Disease] AS
SELECT title, information
FROM  Disease 

GO
/****** Object:  View [dbo].[Doctor_SelfView_Doctor]    Script Date: 13-Jan-17 1:56:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Doctor_SelfView_Doctor] AS
SELECT *
FROM [dbo].[Doctor]
WHERE username = SUSER_SNAME()
GO
INSERT [dbo].[Active Substance] ([ID], [title]) VALUES (221012, N'υδροχλωρική ψευδοεφεδρίνη
')
INSERT [dbo].[Active Substance] ([ID], [title]) VALUES (223452, N'φινγκολιμόδη')
INSERT [dbo].[Active Substance] ([ID], [title]) VALUES (223697, N'διπροπιονική μπεκλομεθαζόνη
')
INSERT [dbo].[Active Substance] ([ID], [title]) VALUES (224578, N'Κορτιζόνη')
INSERT [dbo].[Active Substance] ([ID], [title]) VALUES (226939, N'κροσκαρμελόζη νατρίου
')
INSERT [dbo].[Active Substance] ([ID], [title]) VALUES (226973, N'ιβουπροφαίνη')
INSERT [dbo].[Active Substance] ([ID], [title]) VALUES (226985, N'Παρακεταμόλη')
INSERT [dbo].[Disease] ([ID], [title], [information]) VALUES (11963, N'Καρκίνος του μαστού', N'Καρκίνος που αναπτύσσεται στους γαλακτοπαραγωγούς αδένες του μαστού ή στους γαλακτοφόρους πόρους που μεταφέρουν το γάλα.')
INSERT [dbo].[Disease] ([ID], [title], [information]) VALUES (12336, N'Νόσος του Crohn', N'Φλεγμονώδης νόσος του εντέρου άγνωστης αιτιολογίας, η οποία προκαλεί φλεγμονή του βλεννογόνουLL')
INSERT [dbo].[Disease] ([ID], [title], [information]) VALUES (32698, N'Σακχαρώδης Διαβήτης', N'Μεταβολική ασθένεια η οποία χαρακτηρίζεται από αύξηση της συγκέντρωσης του σακχάρου στο αίμα και διαταραχή του μεταβολισμού της γλυκόζης,')
INSERT [dbo].[Disease] ([ID], [title], [information]) VALUES (47856, N'Άνοια', N'Σοβαρή απώλεια της γενικής νοητικής ικανότητας(απώλεια μνήμης)')
INSERT [dbo].[Disease] ([ID], [title], [information]) VALUES (55674, N'Σκλήρυνση κατά Πλάκας', N'Φλεγμονώδης ασθένεια στην οποία τα μονωτικά καλύμματα των νευρικών κυττάρων στον εγκέφαλο και τη σπονδυλική στήλη καταστρέφονται.')
INSERT [dbo].[Disease] ([ID], [title], [information]) VALUES (69320, N'Άσθμα', N'Χρόνια φλεγμονώδης πάθηση των αεραγωγών που χαρακτηρίζεται από διάφορα επαναλαμβανόμενα συμπτώματα, μεταβλητή στένωση των αεραγωγών και βρογχόσπασμο.')
INSERT [dbo].[Doctor] ([username], [password], [name], [surname], [specialty], [phone]) VALUES (N'Dimaet_et', N'dimi@i33', N'Δήμος ', N'Χατζηπαναγιωτίδης', N'Ορθοπεδικός', N'2431098645')
INSERT [dbo].[Doctor] ([username], [password], [name], [surname], [specialty], [phone]) VALUES (N'drag_andreas', N'da070471', N'Ανδρέας', N'Δραγούμης', N'ωτορινολαρυγγολόγος ', N'2315500011')
INSERT [dbo].[Doctor] ([username], [password], [name], [surname], [specialty], [phone]) VALUES (N'elenaNeuro', N'elena_ts_75', N'Έλενα', N'Τσιρλή', N'Νευρολόγος', N'2110634189')
INSERT [dbo].[Doctor] ([username], [password], [name], [surname], [specialty], [phone]) VALUES (N'hekin_tre', N'trianta30', N'Γεώργιος ', N'Ταρσανίδης', N'Γαστρεντερολόγος', N'2310526897')
INSERT [dbo].[Doctor] ([username], [password], [name], [surname], [specialty], [phone]) VALUES (N'ilian_vent', N'vnt45uti', N'Ηλιάνα ', N'Βέντσιου', N'Γυναικολόγος', N'2115689963')
INSERT [dbo].[Doctor] ([username], [password], [name], [surname], [specialty], [phone]) VALUES (N'karagian68', N'6kar9gian', N'Σπύρος', N'Καραγιαννίδης', N'Ειδικός Παθολόγος', N'2310556598')
INSERT [dbo].[Doctor] ([username], [password], [name], [surname], [specialty], [phone]) VALUES (N'marypetropoulou', N'060162mary', N'Μαρία', N'Πετροπούλου', N'Παιδίατρος', N'2114020355')
INSERT [dbo].[Doctor] ([username], [password], [name], [surname], [specialty], [phone]) VALUES (N'pan..e3234', N'pan@is23', N'Παναγιώτης', N'Παναγιώτου', N'Ουρολόγος', N'2310256897')
INSERT [dbo].[Doctor] ([username], [password], [name], [surname], [specialty], [phone]) VALUES (N'saropoulos77', N'4444As1234', N'Βασίλης', N'Σαρόπουλος', N'Ενδοκρινολόγος', N'2115567003')
INSERT [dbo].[Doctor] ([username], [password], [name], [surname], [specialty], [phone]) VALUES (N'tasos_per', N'p3r4k1s', N'Αναστάσιος', N'Περάκης', N'Ψυχίατρος', N'2610458192')
INSERT [dbo].[Doctor_ActiveSubstance] ([Doctor_Username], [ActiveSubstance_ID], [date]) VALUES (N'drag_andreas', 221012, CAST(N'2016-09-05' AS Date))
INSERT [dbo].[Doctor_ActiveSubstance] ([Doctor_Username], [ActiveSubstance_ID], [date]) VALUES (N'drag_andreas', 223452, CAST(N'2016-05-23' AS Date))
INSERT [dbo].[Doctor_ActiveSubstance] ([Doctor_Username], [ActiveSubstance_ID], [date]) VALUES (N'drag_andreas', 223452, CAST(N'2016-09-05' AS Date))
INSERT [dbo].[Doctor_ActiveSubstance] ([Doctor_Username], [ActiveSubstance_ID], [date]) VALUES (N'elenaNeuro', 226973, CAST(N'2016-05-06' AS Date))
INSERT [dbo].[Doctor_ActiveSubstance] ([Doctor_Username], [ActiveSubstance_ID], [date]) VALUES (N'karagian68', 226973, CAST(N'2015-11-01' AS Date))
INSERT [dbo].[Doctor_ActiveSubstance] ([Doctor_Username], [ActiveSubstance_ID], [date]) VALUES (N'karagian68', 226985, CAST(N'2015-11-01' AS Date))
INSERT [dbo].[Doctor_ActiveSubstance] ([Doctor_Username], [ActiveSubstance_ID], [date]) VALUES (N'marypetropoulou', 221012, CAST(N'2016-09-05' AS Date))
INSERT [dbo].[DoctorLocation] ([username], [address], [city], [postcode]) VALUES (N'Dimaet_et', N'25ης Μαρτίου 23', N'Τρίκαλα', N'42100')
INSERT [dbo].[DoctorLocation] ([username], [address], [city], [postcode]) VALUES (N'drag_andreas', N'Φιλίππου 21', N'Θεσσαλονίκη', N'54635')
INSERT [dbo].[DoctorLocation] ([username], [address], [city], [postcode]) VALUES (N'elenaNeuro', N'Μοναστηράκι 155', N'Αθήνα', N'10431')
INSERT [dbo].[DoctorLocation] ([username], [address], [city], [postcode]) VALUES (N'hekin_tre', N'Τσιμισκή 135', N'Θεσσαλονίκη', N'54633')
INSERT [dbo].[DoctorLocation] ([username], [address], [city], [postcode]) VALUES (N'ilian_vent', N'Πλάτωνος 52', N'Αθήνα', N'12456')
INSERT [dbo].[DoctorLocation] ([username], [address], [city], [postcode]) VALUES (N'karagian68', N'Εγνατία 36', N'Θεσσαλονίκη', N'54633')
INSERT [dbo].[DoctorLocation] ([username], [address], [city], [postcode]) VALUES (N'marypetropoulou', N'Μπυζανίου 3', N'Αιγάλεω', N'12244')
INSERT [dbo].[DoctorLocation] ([username], [address], [city], [postcode]) VALUES (N'pan..e3234', N'Ίωνος Δραγούμη 8', N'Θεσσαλονίκη', N'54653')
INSERT [dbo].[DoctorLocation] ([username], [address], [city], [postcode]) VALUES (N'saropoulos77', N'Κηφισίας 55', N'Αθήνα', N'10438')
INSERT [dbo].[DoctorLocation] ([username], [address], [city], [postcode]) VALUES (N'tasos_per', N'Καβάφη 67', N'Λάρισα', N'41334')
INSERT [dbo].[Drug] ([ID], [title], [information]) VALUES (112235, N'Panadol', N'Για τις ιώσεις και τους πονοκέφαλους')
INSERT [dbo].[Drug] ([ID], [title], [information]) VALUES (112236, N'Becotide ', N'Εισπνεόμενο φάρμακα για το άσθμα')
INSERT [dbo].[Drug] ([ID], [title], [information]) VALUES (113369, N'Nurofen Cold n Flu', N'Κατάλληλο για κρυολογήματα')
INSERT [dbo].[Drug] ([ID], [title], [information]) VALUES (114589, N'Viagra', N'Χαπάκια για την αντιμετώπιση της στυτικής δυσλειτουργίας')
INSERT [dbo].[Drug] ([ID], [title], [information]) VALUES (116984, N'TriCyclic Antidepressants', N'Αντικαταθλιπτικό φάρμακο')
INSERT [dbo].[Drug] ([ID], [title], [information]) VALUES (117562, N'Dexa-Rhinaspray', N'Ρινικές σταγόνες για την αποσυμφόρηση των βλεννογόνων της μύτης και των γειτονικών περιοχών του φάρυγγα.')
INSERT [dbo].[Drug] ([ID], [title], [information]) VALUES (117856, N'Otrivin', N'Ρινικές σταγόνες για την αποσυμφόρηση των βλεννογόνων της μύτης και των γειτονικών περιοχών του φάρυγγα.')
INSERT [dbo].[Drug] ([ID], [title], [information]) VALUES (118963, N'Gilenya', N'Φάρμακο ΣκΠ 2ης γραμμής ')
INSERT [dbo].[Drug_ActiveSubstance] ([Drug_ID], [ActiveSubstance_ID]) VALUES (112235, 226985)
INSERT [dbo].[Drug_ActiveSubstance] ([Drug_ID], [ActiveSubstance_ID]) VALUES (112236, 221012)
INSERT [dbo].[Drug_ActiveSubstance] ([Drug_ID], [ActiveSubstance_ID]) VALUES (112236, 226973)
INSERT [dbo].[Drug_ActiveSubstance] ([Drug_ID], [ActiveSubstance_ID]) VALUES (113369, 226985)
INSERT [dbo].[Drug_ActiveSubstance] ([Drug_ID], [ActiveSubstance_ID]) VALUES (114589, 226939)
INSERT [dbo].[Drug_ActiveSubstance] ([Drug_ID], [ActiveSubstance_ID]) VALUES (118963, 223452)
INSERT [dbo].[Hospital] ([ID], [title], [phone]) VALUES (631023, N'Ωνάσειο', N'2110237789')
INSERT [dbo].[Hospital] ([ID], [title], [phone]) VALUES (632013, N'Ιπποκράτειο', N'2310569998')
INSERT [dbo].[Hospital] ([ID], [title], [phone]) VALUES (634578, N'Αιγινήτειο	', N'2110659874')
INSERT [dbo].[Hospital] ([ID], [title], [phone]) VALUES (635569, N'Πατησίων', N'2110222101')
INSERT [dbo].[Hospital] ([ID], [title], [phone]) VALUES (635987, N'Ευαγγελισμός	', N'2110236974')
INSERT [dbo].[Hospital] ([ID], [title], [phone]) VALUES (635988, N'Α.Χ.Ε.Π.Α.', N'2310444119')
INSERT [dbo].[HospitalLocation] ([ID], [address], [city], [postcode]) VALUES (631023, N'Λεωφορος Συγγρου 356', N'Καλλιθέα', N'17674')
INSERT [dbo].[HospitalLocation] ([ID], [address], [city], [postcode]) VALUES (632013, N'Κωνσταντινουπόλεως 49
', N'Θεσσαλονίκη', N'54642')
INSERT [dbo].[HospitalLocation] ([ID], [address], [city], [postcode]) VALUES (634578, N'Βασ. Σοφίας 72-74', N'Αθήνα', N'11528')
INSERT [dbo].[HospitalLocation] ([ID], [address], [city], [postcode]) VALUES (635569, N'Χαλκίδας 15-17', N'Πατήσια', N'11143')
INSERT [dbo].[HospitalLocation] ([ID], [address], [city], [postcode]) VALUES (635987, N'Υψηλάντου 45-47', N'Αθήνα', N'10676')
INSERT [dbo].[HospitalLocation] ([ID], [address], [city], [postcode]) VALUES (635988, N'Στ. Κυριακίδη 1', N'Θεσσαλονίκη', N'54636')
INSERT [dbo].[Pharmacy] ([username], [password], [name], [surname], [working_hours], [phone]) VALUES (N'alex_a', N'a1l2e3x4', N'Αλεξάνδρα', N'Αραβάνη', N'09:00 - 19:00, καθημεριμά εκτός Κυριακή', N'2445457888')
INSERT [dbo].[Pharmacy] ([username], [password], [name], [surname], [working_hours], [phone]) VALUES (N'annoula**', N'7538642an', N'Άννα', N'Τρεμοπούλου', N'09:00 - 15:00, 17:00-21:00', N'2313505023')
INSERT [dbo].[Pharmacy] ([username], [password], [name], [surname], [working_hours], [phone]) VALUES (N'gon1985', N'gongongon123', N'Νικόλαος', N'
Γονιδάκης', N'09:00 - 15:00, 17:00-21:00', N'2654788964')
INSERT [dbo].[Pharmacy] ([username], [password], [name], [surname], [working_hours], [phone]) VALUES (N'koko93lak', N'kokoras1945', N'Κωνσταντίνος', N'Κοκορίδης', N'10:00 - 18:00', N'2315505652')
INSERT [dbo].[Pharmacy] ([username], [password], [name], [surname], [working_hours], [phone]) VALUES (N'pal_eua', N'4444pal4444eua', N'Ευαγγελία', N'Παλιοτρότζη', N'09:00 - 15:00, 17:00-21:00', N'2103693699')
INSERT [dbo].[Pharmacy] ([username], [password], [name], [surname], [working_hours], [phone]) VALUES (N'plantzasPharmacy', N'platz4567123', N'Γιώργος', N'
Πλαντζάς', N'09:00 - 15:00, 17:00-21:00 εκτός ΣΚ', N'2113654897')
INSERT [dbo].[Pharmacy] ([username], [password], [name], [surname], [working_hours], [phone]) VALUES (N'vita4u', N'vita4u1998', N'Αικατερίνη', N'Μάγου', N'09:00 - 21:00, καθημερινά εκτός ΣΚ', N'2310547896')
INSERT [dbo].[Pharmacy_Drug] ([Pharmacy_Username], [Drug_ID], [Amount]) VALUES (N'alex_a', 112235, 100)
INSERT [dbo].[Pharmacy_Drug] ([Pharmacy_Username], [Drug_ID], [Amount]) VALUES (N'alex_a', 113369, 105)
INSERT [dbo].[Pharmacy_Drug] ([Pharmacy_Username], [Drug_ID], [Amount]) VALUES (N'alex_a', 114589, 20)
INSERT [dbo].[Pharmacy_Drug] ([Pharmacy_Username], [Drug_ID], [Amount]) VALUES (N'annoula**', 117562, 20)
INSERT [dbo].[Pharmacy_Drug] ([Pharmacy_Username], [Drug_ID], [Amount]) VALUES (N'gon1985', 112236, 150)
INSERT [dbo].[Pharmacy_Drug] ([Pharmacy_Username], [Drug_ID], [Amount]) VALUES (N'koko93lak', 117856, 35)
INSERT [dbo].[Pharmacy_Drug] ([Pharmacy_Username], [Drug_ID], [Amount]) VALUES (N'pal_eua', 113369, 60)
INSERT [dbo].[Pharmacy_Drug] ([Pharmacy_Username], [Drug_ID], [Amount]) VALUES (N'pal_eua', 117856, 19)
INSERT [dbo].[Pharmacy_Drug] ([Pharmacy_Username], [Drug_ID], [Amount]) VALUES (N'pal_eua', 118963, 55)
INSERT [dbo].[Pharmacy_Drug] ([Pharmacy_Username], [Drug_ID], [Amount]) VALUES (N'plantzasPharmacy', 116984, 200)
INSERT [dbo].[Pharmacy_Drug] ([Pharmacy_Username], [Drug_ID], [Amount]) VALUES (N'plantzasPharmacy', 117856, 8)
INSERT [dbo].[Pharmacy_Drug] ([Pharmacy_Username], [Drug_ID], [Amount]) VALUES (N'vita4u', 112235, 6)
INSERT [dbo].[PharmacyLocation] ([username], [address], [city], [postcode]) VALUES (N'alex_a', N'Πλουτάρχου 91', N'Βέροια', N'43655')
INSERT [dbo].[PharmacyLocation] ([username], [address], [city], [postcode]) VALUES (N'annoula**', N'Βασ. Όλγας', N'Θεσσαλονίκη', N'54669')
INSERT [dbo].[PharmacyLocation] ([username], [address], [city], [postcode]) VALUES (N'gon1985', N'Κύπρου 77', N'Λάρισα', N'28569')
INSERT [dbo].[PharmacyLocation] ([username], [address], [city], [postcode]) VALUES (N'koko93lak', N'Βασιλέως Ηρακλείου 4', N'Θεσσαλονίκη', N'54635')
INSERT [dbo].[PharmacyLocation] ([username], [address], [city], [postcode]) VALUES (N'pal_eua', N'Ιερά Οδός 128', N'Αθήνα', N'10256')
INSERT [dbo].[PharmacyLocation] ([username], [address], [city], [postcode]) VALUES (N'plantzasPharmacy', N'Μητροπόλεως 2', N'Αθήνα', N'11203')
INSERT [dbo].[PharmacyLocation] ([username], [address], [city], [postcode]) VALUES (N'vita4u', N'Εγνατία 45', N'Θεσσαλονίκη', N'54635')
INSERT [dbo].[User] ([username], [IID], [password]) VALUES (N'andreas.12', 158977, N'anderw22')
INSERT [dbo].[User] ([username], [IID], [password]) VALUES (N'andyX-93', 156315, N'XrAn93*')
INSERT [dbo].[User] ([username], [IID], [password]) VALUES (N'hellow', 2165161, N'oooleelel33')
INSERT [dbo].[User] ([username], [IID], [password]) VALUES (N'katerina_x', 154230, N'44_katy_princess_44')
INSERT [dbo].[User] ([username], [IID], [password]) VALUES (N'komodikhs94', 152009, N'9412!5**')
INSERT [dbo].[User] ([username], [IID], [password]) VALUES (N'krik88', 154796, N'paok_ole!*')
INSERT [dbo].[User] ([username], [IID], [password]) VALUES (N'marigoula_p', 158963, N'4m44m4_93')
INSERT [dbo].[User] ([username], [IID], [password]) VALUES (N'pet45pet', 156698, N'petros123456')
INSERT [dbo].[User] ([username], [IID], [password]) VALUES (N'tasos_per', 156478, N'p3r4k1s')
INSERT [dbo].[User_Disease] ([User_Username], [Disease_ID], [start_day], [end_day]) VALUES (N'andyX-93', 69320, CAST(N'1998-02-05' AS Date), NULL)
INSERT [dbo].[User_Disease] ([User_Username], [Disease_ID], [start_day], [end_day]) VALUES (N'katerina_x', 11963, CAST(N'2014-06-05' AS Date), CAST(N'2016-08-05' AS Date))
INSERT [dbo].[User_Disease] ([User_Username], [Disease_ID], [start_day], [end_day]) VALUES (N'krik88', 32698, CAST(N'2011-11-06' AS Date), NULL)
INSERT [dbo].[User_Disease] ([User_Username], [Disease_ID], [start_day], [end_day]) VALUES (N'krik88', 55674, CAST(N'2013-08-01' AS Date), NULL)
INSERT [dbo].[User_Disease] ([User_Username], [Disease_ID], [start_day], [end_day]) VALUES (N'marigoula_p', 69320, CAST(N'2015-07-05' AS Date), CAST(N'2015-11-05' AS Date))
INSERT [dbo].[User_Doctor] ([User_Username], [Doctor_Username], [date]) VALUES (N'komodikhs94', N'saropoulos77', CAST(N'2012-11-06' AS Date))
INSERT [dbo].[User_Doctor] ([User_Username], [Doctor_Username], [date]) VALUES (N'krik88', N'karagian68', CAST(N'2016-06-12' AS Date))
INSERT [dbo].[User_Doctor] ([User_Username], [Doctor_Username], [date]) VALUES (N'krik88', N'karagian68', CAST(N'2016-08-15' AS Date))
INSERT [dbo].[User_Doctor] ([User_Username], [Doctor_Username], [date]) VALUES (N'marigoula_p', N'elenaNeuro', CAST(N'2015-07-05' AS Date))
INSERT [dbo].[User_Doctor] ([User_Username], [Doctor_Username], [date]) VALUES (N'marigoula_p', N'karagian68', CAST(N'2015-07-05' AS Date))
INSERT [dbo].[User_Doctor] ([User_Username], [Doctor_Username], [date]) VALUES (N'pet45pet', N'tasos_per', CAST(N'2013-09-10' AS Date))
INSERT [dbo].[User_Doctor] ([User_Username], [Doctor_Username], [date]) VALUES (N'pet45pet', N'tasos_per', CAST(N'2014-10-11' AS Date))
INSERT [dbo].[User_Drug] ([User_Username], [Drug_ID], [start_day], [end_day]) VALUES (N'andreas.12', 112235, CAST(N'2016-11-02' AS Date), CAST(N'2016-11-15' AS Date))
INSERT [dbo].[User_Drug] ([User_Username], [Drug_ID], [start_day], [end_day]) VALUES (N'andyX-93', 112235, CAST(N'2016-04-05' AS Date), CAST(N'2016-05-05' AS Date))
INSERT [dbo].[User_Drug] ([User_Username], [Drug_ID], [start_day], [end_day]) VALUES (N'andyX-93', 112235, CAST(N'2016-09-08' AS Date), CAST(N'2016-10-08' AS Date))
INSERT [dbo].[User_Drug] ([User_Username], [Drug_ID], [start_day], [end_day]) VALUES (N'katerina_x', 112236, CAST(N'2012-11-03' AS Date), NULL)
INSERT [dbo].[User_Drug] ([User_Username], [Drug_ID], [start_day], [end_day]) VALUES (N'komodikhs94', 114589, CAST(N'2016-11-23' AS Date), CAST(N'2016-11-23' AS Date))
INSERT [dbo].[User_Drug] ([User_Username], [Drug_ID], [start_day], [end_day]) VALUES (N'krik88', 116984, CAST(N'2005-03-05' AS Date), CAST(N'2007-07-05' AS Date))
INSERT [dbo].[User_Drug] ([User_Username], [Drug_ID], [start_day], [end_day]) VALUES (N'krik88', 116984, CAST(N'2012-07-03' AS Date), NULL)
INSERT [dbo].[User_Drug] ([User_Username], [Drug_ID], [start_day], [end_day]) VALUES (N'marigoula_p', 118963, CAST(N'2010-02-09' AS Date), CAST(N'2015-07-06' AS Date))
INSERT [dbo].[User_Hospital] ([User_Username], [Hospital_ID], [date]) VALUES (N'katerina_x', 632013, CAST(N'2016-06-01' AS Date))
INSERT [dbo].[User_Hospital] ([User_Username], [Hospital_ID], [date]) VALUES (N'komodikhs94', 635988, CAST(N'2014-05-18' AS Date))
INSERT [dbo].[User_Hospital] ([User_Username], [Hospital_ID], [date]) VALUES (N'komodikhs94', 635988, CAST(N'2014-06-20' AS Date))
INSERT [dbo].[User_Hospital] ([User_Username], [Hospital_ID], [date]) VALUES (N'komodikhs94', 635988, CAST(N'2014-11-29' AS Date))
INSERT [dbo].[User_Hospital] ([User_Username], [Hospital_ID], [date]) VALUES (N'krik88', 631023, CAST(N'2014-05-25' AS Date))
INSERT [dbo].[User_Hospital] ([User_Username], [Hospital_ID], [date]) VALUES (N'marigoula_p', 631023, CAST(N'2015-05-18' AS Date))
INSERT [dbo].[User_Hospital] ([User_Username], [Hospital_ID], [date]) VALUES (N'marigoula_p', 635569, CAST(N'2015-05-14' AS Date))
INSERT [dbo].[User_Pharmacy] ([User_Username], [Pharmacy_Username], [date]) VALUES (N'katerina_x', N'alex_a', CAST(N'2016-05-06' AS Date))
INSERT [dbo].[User_Pharmacy] ([User_Username], [Pharmacy_Username], [date]) VALUES (N'katerina_x', N'alex_a', CAST(N'2016-05-08' AS Date))
INSERT [dbo].[User_Pharmacy] ([User_Username], [Pharmacy_Username], [date]) VALUES (N'komodikhs94', N'annoula**', CAST(N'2015-07-03' AS Date))
INSERT [dbo].[User_Pharmacy] ([User_Username], [Pharmacy_Username], [date]) VALUES (N'krik88', N'gon1985', CAST(N'2016-11-09' AS Date))
INSERT [dbo].[User_Pharmacy] ([User_Username], [Pharmacy_Username], [date]) VALUES (N'marigoula_p', N'pal_eua', CAST(N'2015-12-06' AS Date))
INSERT [dbo].[User_Pharmacy] ([User_Username], [Pharmacy_Username], [date]) VALUES (N'pet45pet', N'pal_eua', CAST(N'2016-05-04' AS Date))
INSERT [dbo].[UserName] ([username], [name], [surname]) VALUES (N'andreas.12', N'Ανδρέας', N'Ανδρέου')
INSERT [dbo].[UserName] ([username], [name], [surname]) VALUES (N'andyX-93', N'Ανδρέας', N'Χρύσης')
INSERT [dbo].[UserName] ([username], [name], [surname]) VALUES (N'katerina_x', N'Κατερίνα', N'Χρυσοστόμου')
INSERT [dbo].[UserName] ([username], [name], [surname]) VALUES (N'komodikhs94', N'Δημήτρης', N'Κωμοδίκης')
INSERT [dbo].[UserName] ([username], [name], [surname]) VALUES (N'krik88', N'Κυριάκος', N'Κρικέλλας')
INSERT [dbo].[UserName] ([username], [name], [surname]) VALUES (N'marigoula_p', N'Μαρία', N'Παπαδημητρίου')
INSERT [dbo].[UserName] ([username], [name], [surname]) VALUES (N'pet45pet', N'Πέτρος', N'Κωστόπουλος')
INSERT [dbo].[UserName] ([username], [name], [surname]) VALUES (N'tasos_per', N'Αναστάσιος', N'Περάκης')
/****** Object:  Index [uc_IID]    Script Date: 13-Jan-17 1:56:26 AM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [uc_IID] UNIQUE NONCLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Doctor_ActiveSubstance]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_ActiveSubstance_Active Substance] FOREIGN KEY([ActiveSubstance_ID])
REFERENCES [dbo].[Active Substance] ([ID])
GO
ALTER TABLE [dbo].[Doctor_ActiveSubstance] CHECK CONSTRAINT [FK_Doctor_ActiveSubstance_Active Substance]
GO
ALTER TABLE [dbo].[Doctor_ActiveSubstance]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_ActiveSubstance_Doctor] FOREIGN KEY([Doctor_Username])
REFERENCES [dbo].[Doctor] ([username])
GO
ALTER TABLE [dbo].[Doctor_ActiveSubstance] CHECK CONSTRAINT [FK_Doctor_ActiveSubstance_Doctor]
GO
ALTER TABLE [dbo].[DoctorLocation]  WITH CHECK ADD  CONSTRAINT [FK_DoctorLocation_Doctor] FOREIGN KEY([username])
REFERENCES [dbo].[Doctor] ([username])
GO
ALTER TABLE [dbo].[DoctorLocation] CHECK CONSTRAINT [FK_DoctorLocation_Doctor]
GO
ALTER TABLE [dbo].[Drug_ActiveSubstance]  WITH CHECK ADD  CONSTRAINT [FK_Drug_ActiveSubstance_Active Substance] FOREIGN KEY([ActiveSubstance_ID])
REFERENCES [dbo].[Active Substance] ([ID])
GO
ALTER TABLE [dbo].[Drug_ActiveSubstance] CHECK CONSTRAINT [FK_Drug_ActiveSubstance_Active Substance]
GO
ALTER TABLE [dbo].[Drug_ActiveSubstance]  WITH CHECK ADD  CONSTRAINT [FK_Drug_ActiveSubstance_Drug] FOREIGN KEY([Drug_ID])
REFERENCES [dbo].[Drug] ([ID])
GO
ALTER TABLE [dbo].[Drug_ActiveSubstance] CHECK CONSTRAINT [FK_Drug_ActiveSubstance_Drug]
GO
ALTER TABLE [dbo].[HospitalLocation]  WITH CHECK ADD  CONSTRAINT [FK_HospitalLocation_Hospital] FOREIGN KEY([ID])
REFERENCES [dbo].[Hospital] ([ID])
GO
ALTER TABLE [dbo].[HospitalLocation] CHECK CONSTRAINT [FK_HospitalLocation_Hospital]
GO
ALTER TABLE [dbo].[Pharmacy_Drug]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacy_Drug_Drug] FOREIGN KEY([Drug_ID])
REFERENCES [dbo].[Drug] ([ID])
GO
ALTER TABLE [dbo].[Pharmacy_Drug] CHECK CONSTRAINT [FK_Pharmacy_Drug_Drug]
GO
ALTER TABLE [dbo].[Pharmacy_Drug]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacy_Drug_Pharmacy] FOREIGN KEY([Pharmacy_Username])
REFERENCES [dbo].[Pharmacy] ([username])
GO
ALTER TABLE [dbo].[Pharmacy_Drug] CHECK CONSTRAINT [FK_Pharmacy_Drug_Pharmacy]
GO
ALTER TABLE [dbo].[PharmacyLocation]  WITH CHECK ADD  CONSTRAINT [FK_PharmacyLocation_Pharmacy] FOREIGN KEY([username])
REFERENCES [dbo].[Pharmacy] ([username])
GO
ALTER TABLE [dbo].[PharmacyLocation] CHECK CONSTRAINT [FK_PharmacyLocation_Pharmacy]
GO
ALTER TABLE [dbo].[User_Disease]  WITH CHECK ADD  CONSTRAINT [FK_User_Disease_Disease] FOREIGN KEY([Disease_ID])
REFERENCES [dbo].[Disease] ([ID])
GO
ALTER TABLE [dbo].[User_Disease] CHECK CONSTRAINT [FK_User_Disease_Disease]
GO
ALTER TABLE [dbo].[User_Disease]  WITH CHECK ADD  CONSTRAINT [FK_User_Disease_User] FOREIGN KEY([User_Username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[User_Disease] CHECK CONSTRAINT [FK_User_Disease_User]
GO
ALTER TABLE [dbo].[User_Doctor]  WITH CHECK ADD  CONSTRAINT [FK_User_Doctor_Doctor1] FOREIGN KEY([Doctor_Username])
REFERENCES [dbo].[Doctor] ([username])
GO
ALTER TABLE [dbo].[User_Doctor] CHECK CONSTRAINT [FK_User_Doctor_Doctor1]
GO
ALTER TABLE [dbo].[User_Doctor]  WITH CHECK ADD  CONSTRAINT [FK_User_Doctor_User] FOREIGN KEY([User_Username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[User_Doctor] CHECK CONSTRAINT [FK_User_Doctor_User]
GO
ALTER TABLE [dbo].[User_Drug]  WITH CHECK ADD  CONSTRAINT [FK_User_Drug_Drug] FOREIGN KEY([Drug_ID])
REFERENCES [dbo].[Drug] ([ID])
GO
ALTER TABLE [dbo].[User_Drug] CHECK CONSTRAINT [FK_User_Drug_Drug]
GO
ALTER TABLE [dbo].[User_Drug]  WITH CHECK ADD  CONSTRAINT [FK_User_Drug_User] FOREIGN KEY([User_Username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[User_Drug] CHECK CONSTRAINT [FK_User_Drug_User]
GO
ALTER TABLE [dbo].[User_Hospital]  WITH CHECK ADD  CONSTRAINT [FK_User_Hospital_Hospital] FOREIGN KEY([Hospital_ID])
REFERENCES [dbo].[Hospital] ([ID])
GO
ALTER TABLE [dbo].[User_Hospital] CHECK CONSTRAINT [FK_User_Hospital_Hospital]
GO
ALTER TABLE [dbo].[User_Hospital]  WITH CHECK ADD  CONSTRAINT [FK_User_Hospital_User] FOREIGN KEY([User_Username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[User_Hospital] CHECK CONSTRAINT [FK_User_Hospital_User]
GO
ALTER TABLE [dbo].[User_Pharmacy]  WITH CHECK ADD  CONSTRAINT [FK_User_Pharmacy_Pharmacy] FOREIGN KEY([Pharmacy_Username])
REFERENCES [dbo].[Pharmacy] ([username])
GO
ALTER TABLE [dbo].[User_Pharmacy] CHECK CONSTRAINT [FK_User_Pharmacy_Pharmacy]
GO
ALTER TABLE [dbo].[User_Pharmacy]  WITH CHECK ADD  CONSTRAINT [FK_User_Pharmacy_User] FOREIGN KEY([User_Username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[User_Pharmacy] CHECK CONSTRAINT [FK_User_Pharmacy_User]
GO
ALTER TABLE [dbo].[UserName]  WITH CHECK ADD  CONSTRAINT [FK_UserName_UserName] FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[UserName] CHECK CONSTRAINT [FK_UserName_UserName]
GO
ALTER TABLE [dbo].[Active Substance]  WITH CHECK ADD  CONSTRAINT [ID] CHECK  (([ID]>(0)))
GO
ALTER TABLE [dbo].[Active Substance] CHECK CONSTRAINT [ID]
GO
ALTER TABLE [dbo].[Disease]  WITH CHECK ADD  CONSTRAINT [disease_ID] CHECK  (([ID]>(0)))
GO
ALTER TABLE [dbo].[Disease] CHECK CONSTRAINT [disease_ID]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [D_username] CHECK  ((len([username])>=(6)))
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [D_username]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [password] CHECK  ((len([password])>=(7)))
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [password]
GO
ALTER TABLE [dbo].[Drug]  WITH CHECK ADD  CONSTRAINT [drug_ID] CHECK  (([ID]>(0)))
GO
ALTER TABLE [dbo].[Drug] CHECK CONSTRAINT [drug_ID]
GO
ALTER TABLE [dbo].[Hospital]  WITH CHECK ADD  CONSTRAINT [Hospital_ID] CHECK  (([ID]>(0)))
GO
ALTER TABLE [dbo].[Hospital] CHECK CONSTRAINT [Hospital_ID]
GO
ALTER TABLE [dbo].[Pharmacy]  WITH CHECK ADD  CONSTRAINT [Pharm_password] CHECK  ((len([password])>=(7)))
GO
ALTER TABLE [dbo].[Pharmacy] CHECK CONSTRAINT [Pharm_password]
GO
ALTER TABLE [dbo].[Pharmacy]  WITH CHECK ADD  CONSTRAINT [Pharm_username] CHECK  ((len([username])>=(6)))
GO
ALTER TABLE [dbo].[Pharmacy] CHECK CONSTRAINT [Pharm_username]
GO
ALTER TABLE [dbo].[Pharmacy_Drug]  WITH CHECK ADD  CONSTRAINT [Pharm_Drug_Amount] CHECK  (([Amount]>=(0)))
GO
ALTER TABLE [dbo].[Pharmacy_Drug] CHECK CONSTRAINT [Pharm_Drug_Amount]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [user_IID] CHECK  (([IID]>(0)))
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [user_IID]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [User_password] CHECK  ((len([password])>=(7)))
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [User_password]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [User_username] CHECK  ((len([username])>=(6)))
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [User_username]
GO
ALTER TABLE [dbo].[User_Disease]  WITH CHECK ADD  CONSTRAINT [User_Disease_dates] CHECK  (([start_day]<=[end_day]))
GO
ALTER TABLE [dbo].[User_Disease] CHECK CONSTRAINT [User_Disease_dates]
GO
ALTER TABLE [dbo].[User_Drug]  WITH CHECK ADD  CONSTRAINT [User_Drug_dates] CHECK  (([start_day]<=[end_day]))
GO
ALTER TABLE [dbo].[User_Drug] CHECK CONSTRAINT [User_Drug_dates]
GO
USE [master]
GO
ALTER DATABASE [HealthTracker] SET  READ_WRITE 
GO
