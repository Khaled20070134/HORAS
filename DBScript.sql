USE [master]
GO
/****** Object:  Database [HORAS]    Script Date: 7/28/2024 8:15:28 PM ******/
CREATE DATABASE [HORAS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HORAS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HORAS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HORAS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HORAS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HORAS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HORAS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HORAS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HORAS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HORAS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HORAS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HORAS] SET ARITHABORT OFF 
GO
ALTER DATABASE [HORAS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HORAS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HORAS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HORAS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HORAS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HORAS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HORAS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HORAS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HORAS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HORAS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HORAS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HORAS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HORAS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HORAS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HORAS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HORAS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HORAS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HORAS] SET RECOVERY FULL 
GO
ALTER DATABASE [HORAS] SET  MULTI_USER 
GO
ALTER DATABASE [HORAS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HORAS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HORAS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HORAS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HORAS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HORAS', N'ON'
GO
USE [HORAS]
GO
/****** Object:  User [Login]    Script Date: 7/28/2024 8:15:29 PM ******/
CREATE USER [Login] FOR LOGIN [Login] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Log2]    Script Date: 7/28/2024 8:15:29 PM ******/
CREATE USER [Log2] FOR LOGIN [Log2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Log]    Script Date: 7/28/2024 8:15:29 PM ******/
CREATE USER [Log] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Login]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [Login]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [Login]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [Login]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [Login]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Login]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Login]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [Login]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [Login]
GO
ALTER ROLE [db_owner] ADD MEMBER [Log2]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [Log2]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [Log2]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [Log2]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [Log2]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Log2]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Log2]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [Log2]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [Log2]
GO
ALTER ROLE [db_owner] ADD MEMBER [Log]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [Log]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [Log]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [Log]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [Log]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Log]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Log]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [Log]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [Log]
GO
/****** Object:  Table [dbo].[AssessmentHead]    Script Date: 7/28/2024 8:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentHead](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Confirmed] [bit] NULL,
	[ConfirmationDate] [date] NULL,
	[ConfirmedBy] [int] NULL,
	[Subject] [nvarchar](100) NULL,
	[About] [nvarchar](100) NULL,
 CONSTRAINT [PK_AssessmentHead] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssItems]    Script Date: 7/28/2024 8:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](50) NULL,
	[Description] [nvarchar](1000) NULL,
	[Qty] [float] NULL,
	[Total_Price] [float] NULL,
	[AssID] [int] NULL,
	[Item_Unit] [nvarchar](10) NULL,
	[Contract_ID] [int] NULL,
	[Item_Type] [int] NULL,
	[LOL] [float] NULL,
 CONSTRAINT [PK_AssItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BGL]    Script Date: 7/28/2024 8:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BGL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Serial] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[ContractID] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_BGL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contract]    Script Date: 7/28/2024 8:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Duration] [int] NULL,
	[DelayPenaltyP] [float] NULL,
	[Party] [int] NULL,
	[Contract_type] [int] NULL,
	[CreationDate] [date] NULL,
	[StartDate] [date] NULL,
	[StartedBy] [int] NULL,
	[CreatedBy] [int] NULL,
	[DownpaymentP] [float] NULL,
	[BusinessInsuranceP] [float] NULL,
	[Total_Amount] [float] NULL,
	[Number] [nvarchar](50) NULL,
	[Short_Desc] [nvarchar](200) NULL,
	[FI_Completed] [bit] NULL,
	[IM_Completed] [bit] NULL,
	[Signed] [bit] NULL,
	[ProfitPercentage] [float] NULL,
	[OwnerContractID] [int] NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 7/28/2024 8:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Username] [nvarchar](20) NULL,
	[Password] [nvarchar](20) NULL,
	[Gender] [int] NULL,
	[DateOfBirth] [datetime] NULL,
	[Email] [nvarchar](50) NULL,
	[Role] [int] NULL,
	[Phone] [nvarchar](20) NULL,
	[Blocked] [bit] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExpansesMajor]    Script Date: 7/28/2024 8:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpansesMajor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
 CONSTRAINT [PK_ExpansesMajor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExpansesMinor]    Script Date: 7/28/2024 8:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpansesMinor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HeadID] [int] NULL,
	[Title] [nvarchar](200) NULL,
 CONSTRAINT [PK_ExpansesMinor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExpTrans]    Script Date: 7/28/2024 8:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpTrans](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ExpID] [int] NULL,
	[CreatedBy] [int] NULL,
	[Amount] [decimal](18, 0) NULL,
	[Tr_Date] [date] NULL,
	[Description] [nvarchar](200) NULL,
	[ContractID] [int] NULL,
	[AttachFile] [nvarchar](200) NULL,
	[ItemNo] [int] NULL,
	[NeedConf] [bit] NULL,
 CONSTRAINT [PK_ExpTrans] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InterimsHead]    Script Date: 7/28/2024 8:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterimsHead](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[In_Date] [date] NULL,
	[ContractID] [int] NULL,
	[Confirm_Date] [date] NULL,
	[Number] [nvarchar](30) NULL,
 CONSTRAINT [PK_InterimsHead] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InterimsItems]    Script Date: 7/28/2024 8:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterimsItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](10) NULL,
	[Qty] [float] NULL,
	[Price_Unit] [float] NULL,
	[HeadID] [int] NULL,
	[IsBilled] [bit] NULL,
 CONSTRAINT [PK_InterimsItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log_Table]    Script Date: 7/28/2024 8:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[Description] [nvarchar](200) NULL,
	[ActivityDate] [date] NULL,
	[Note] [nvarchar](200) NULL,
	[Mode] [int] NULL,
 CONSTRAINT [PK_Log_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Party]    Script Date: 7/28/2024 8:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Party](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[TaxRegNumber] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[TaxDocument] [nvarchar](50) NULL,
 CONSTRAINT [PK_Party] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 7/28/2024 8:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[TaxReg] [nvarchar](9) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [nvarchar](11) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[AssItems]  WITH CHECK ADD  CONSTRAINT [FK_AssItems_AssessmentHead] FOREIGN KEY([AssID])
REFERENCES [dbo].[AssessmentHead] ([ID])
GO
ALTER TABLE [dbo].[AssItems] CHECK CONSTRAINT [FK_AssItems_AssessmentHead]
GO
ALTER TABLE [dbo].[AssItems]  WITH CHECK ADD  CONSTRAINT [FK_AssItems_Contract] FOREIGN KEY([Contract_ID])
REFERENCES [dbo].[Contract] ([ID])
GO
ALTER TABLE [dbo].[AssItems] CHECK CONSTRAINT [FK_AssItems_Contract]
GO
ALTER TABLE [dbo].[BGL]  WITH CHECK ADD  CONSTRAINT [FK_BGL_Contract] FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contract] ([ID])
GO
ALTER TABLE [dbo].[BGL] CHECK CONSTRAINT [FK_BGL_Contract]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Contract] FOREIGN KEY([OwnerContractID])
REFERENCES [dbo].[Contract] ([ID])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Contract]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Party] FOREIGN KEY([Party])
REFERENCES [dbo].[Party] ([ID])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Party]
GO
ALTER TABLE [dbo].[ExpansesMinor]  WITH CHECK ADD  CONSTRAINT [FK_ExpansesMinor_ExpansesMajor] FOREIGN KEY([HeadID])
REFERENCES [dbo].[ExpansesMajor] ([ID])
GO
ALTER TABLE [dbo].[ExpansesMinor] CHECK CONSTRAINT [FK_ExpansesMinor_ExpansesMajor]
GO
ALTER TABLE [dbo].[ExpTrans]  WITH CHECK ADD  CONSTRAINT [FK_ExpTrans_AssItems] FOREIGN KEY([ItemNo])
REFERENCES [dbo].[AssItems] ([ID])
GO
ALTER TABLE [dbo].[ExpTrans] CHECK CONSTRAINT [FK_ExpTrans_AssItems]
GO
ALTER TABLE [dbo].[ExpTrans]  WITH CHECK ADD  CONSTRAINT [FK_ExpTrans_Contract] FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contract] ([ID])
GO
ALTER TABLE [dbo].[ExpTrans] CHECK CONSTRAINT [FK_ExpTrans_Contract]
GO
ALTER TABLE [dbo].[ExpTrans]  WITH CHECK ADD  CONSTRAINT [FK_ExpTrans_Employees] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[ExpTrans] CHECK CONSTRAINT [FK_ExpTrans_Employees]
GO
ALTER TABLE [dbo].[ExpTrans]  WITH CHECK ADD  CONSTRAINT [FK_ExpTrans_ExpansesMinor] FOREIGN KEY([ExpID])
REFERENCES [dbo].[ExpansesMinor] ([ID])
GO
ALTER TABLE [dbo].[ExpTrans] CHECK CONSTRAINT [FK_ExpTrans_ExpansesMinor]
GO
ALTER TABLE [dbo].[InterimsHead]  WITH CHECK ADD  CONSTRAINT [FK_InterimsHead_Contract] FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contract] ([ID])
GO
ALTER TABLE [dbo].[InterimsHead] CHECK CONSTRAINT [FK_InterimsHead_Contract]
GO
ALTER TABLE [dbo].[InterimsItems]  WITH CHECK ADD  CONSTRAINT [FK_InterimsItems_InterimsHead] FOREIGN KEY([HeadID])
REFERENCES [dbo].[InterimsHead] ([ID])
GO
ALTER TABLE [dbo].[InterimsItems] CHECK CONSTRAINT [FK_InterimsItems_InterimsHead]
GO
ALTER TABLE [dbo].[Log_Table]  WITH CHECK ADD  CONSTRAINT [FK_Log_Table_Employees] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Log_Table] CHECK CONSTRAINT [FK_Log_Table_Employees]
GO
USE [master]
GO
ALTER DATABASE [HORAS] SET  READ_WRITE 
GO
