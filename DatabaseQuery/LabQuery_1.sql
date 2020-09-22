USE [master]
GO
/****** Object:  Database [Laboratoty_Dev]    Script Date: 22-09-2020 10.30.34 PM ******/
CREATE DATABASE [Laboratoty_Dev]
GO
ALTER DATABASE [Laboratoty_Dev] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Laboratoty_Dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Laboratoty_Dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Laboratoty_Dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Laboratoty_Dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Laboratoty_Dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Laboratoty_Dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET RECOVERY FULL 
GO
ALTER DATABASE [Laboratoty_Dev] SET  MULTI_USER 
GO
ALTER DATABASE [Laboratoty_Dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Laboratoty_Dev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Laboratoty_Dev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Laboratoty_Dev] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Laboratoty_Dev] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Laboratoty_Dev', N'ON'
GO
USE [Laboratoty_Dev]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 22-09-2020 10.30.34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillHeaderId] [int] NOT NULL,
	[MasterTestDetailId] [int] NOT NULL,
	[UnitPrice] [decimal](14, 2) NOT NULL,
	[NoOfTest] [int] NOT NULL,
	[Amount] [decimal](14, 2) NOT NULL,
	[CreatedUser] [nvarchar](80) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedUser] [nvarchar](80) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BillDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillHeader]    Script Date: 22-09-2020 10.30.34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillHeader](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [nvarchar](20) NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[MasterPatientId] [int] NOT NULL,
	[MasterCompanyId] [int] NOT NULL,
	[MasterDoctorId] [int] NULL,
	[Amount] [decimal](14, 2) NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NOT NULL,
	[DiscountAmount] [decimal](14, 2) NOT NULL,
	[GrandTotal] [decimal](14, 2) NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[EnumPaymentTypeId] [int] NULL,
	[ChequeNo] [nvarchar](50) NULL,
	[MasterBankId] [int] NULL,
	[CreatedUser] [nvarchar](80) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedUser] [nvarchar](80) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BillHeader_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnumPaymentType]    Script Date: 22-09-2020 10.30.34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnumPaymentType](
	[Id] [int] NOT NULL,
	[PaymentType] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_EnumPaymentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterBankDetail]    Script Date: 22-09-2020 10.30.34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterBankDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MasterCompanyId] [int] NOT NULL,
	[AccountNumber] [nvarchar](20) NOT NULL,
	[BankName] [nvarchar](50) NOT NULL,
	[IFSCCode] [nvarchar](11) NOT NULL,
	[Branch] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](150) NULL,
	[CreatedUser] [nvarchar](80) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedUser] [nvarchar](80) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MasterBankDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterCompany]    Script Date: 22-09-2020 10.30.34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterCompany](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyCode] [varchar](8) NOT NULL,
	[CompanyName1] [nvarchar](100) NOT NULL,
	[CompanyName2] [nvarchar](100) NULL,
	[EmailAddress] [varchar](50) NULL,
	[PostalCode] [varchar](10) NOT NULL,
	[Address1] [nvarchar](150) NOT NULL,
	[Address2] [nvarchar](150) NULL,
	[TelephoneNo1] [varchar](20) NOT NULL,
	[TelephoneNo2] [varchar](20) NULL,
	[GSTIN] [varchar](20) NULL,
	[PAN] [varchar](20) NULL,
	[RegistrationNumber] [varchar](50) NULL,
	[FaxNo1] [varchar](20) NULL,
	[FaxNo2] [varchar](20) NULL,
	[City] [varchar](20) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[Country] [varchar](20) NOT NULL,
	[CreatedUser] [nvarchar](80) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedUser] [nvarchar](80) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MasterCompany] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterDoctor]    Script Date: 22-09-2020 10.30.34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterDoctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [nvarchar](200) NOT NULL,
	[ContactNo] [nvarchar](20) NULL,
	[City] [nvarchar](20) NULL,
	[CreatedUser] [nvarchar](80) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedUser] [nvarchar](80) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MasterDoctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterPatient]    Script Date: 22-09-2020 10.30.34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterPatient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientFirstName] [nvarchar](200) NOT NULL,
	[PatientMiddleName] [nvarchar](200) NOT NULL,
	[PatientlastName] [nvarchar](200) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[TelephoneNo1] [varchar](20) NULL,
	[TelephoneNo2] [varchar](20) NOT NULL,
	[City] [nvarchar](40) NULL,
	[State] [nvarchar](40) NULL,
	[Country] [nvarchar](40) NULL,
	[MasterDoctorId] [int] NULL,
	[CreatedUser] [nvarchar](80) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedUser] [nvarchar](80) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MasterPatient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterTest]    Script Date: 22-09-2020 10.30.34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterTest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestNo] [int] NOT NULL,
	[TestName] [nvarchar](80) NOT NULL,
	[UnitPrice] [decimal](14, 2) NOT NULL,
	[CreatedUser] [nvarchar](80) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedUser] [nvarchar](80) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MasterTest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterUser]    Script Date: 22-09-2020 10.30.34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserCode] [nvarchar](80) NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[CreatedUser] [nvarchar](80) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedUser] [nvarchar](80) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MasterUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_BillHeader] FOREIGN KEY([BillHeaderId])
REFERENCES [dbo].[BillHeader] ([Id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_BillHeader]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_MasterTest] FOREIGN KEY([MasterTestDetailId])
REFERENCES [dbo].[MasterTest] ([Id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_MasterTest]
GO
ALTER TABLE [dbo].[BillHeader]  WITH CHECK ADD  CONSTRAINT [FK_BillHeader_EnumPaymentType] FOREIGN KEY([EnumPaymentTypeId])
REFERENCES [dbo].[EnumPaymentType] ([Id])
GO
ALTER TABLE [dbo].[BillHeader] CHECK CONSTRAINT [FK_BillHeader_EnumPaymentType]
GO
ALTER TABLE [dbo].[BillHeader]  WITH CHECK ADD  CONSTRAINT [FK_BillHeader_MasterBankDetail] FOREIGN KEY([MasterBankId])
REFERENCES [dbo].[MasterBankDetail] ([Id])
GO
ALTER TABLE [dbo].[BillHeader] CHECK CONSTRAINT [FK_BillHeader_MasterBankDetail]
GO
ALTER TABLE [dbo].[BillHeader]  WITH CHECK ADD  CONSTRAINT [FK_BillHeader_MasterCompany] FOREIGN KEY([MasterCompanyId])
REFERENCES [dbo].[MasterCompany] ([Id])
GO
ALTER TABLE [dbo].[BillHeader] CHECK CONSTRAINT [FK_BillHeader_MasterCompany]
GO
ALTER TABLE [dbo].[BillHeader]  WITH CHECK ADD  CONSTRAINT [FK_BillHeader_MasterDoctor] FOREIGN KEY([MasterDoctorId])
REFERENCES [dbo].[MasterDoctor] ([Id])
GO
ALTER TABLE [dbo].[BillHeader] CHECK CONSTRAINT [FK_BillHeader_MasterDoctor]
GO
ALTER TABLE [dbo].[BillHeader]  WITH CHECK ADD  CONSTRAINT [FK_BillHeader_MasterPatient] FOREIGN KEY([MasterPatientId])
REFERENCES [dbo].[MasterPatient] ([Id])
GO
ALTER TABLE [dbo].[BillHeader] CHECK CONSTRAINT [FK_BillHeader_MasterPatient]
GO
/****** Object:  StoredProcedure [dbo].[BillDetailPrint]    Script Date: 22-09-2020 10.30.34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BillDetailPrint] (@invoiceNo NVARCHAR(200))
-- Add the parameters for the stored procedure here
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

SELECT *
FROM BillHeader BH
INNER JOIN BillDetail BD ON BH.Id = BD.BillHeaderId
LEFT JOIN MasterBankDetail MBD ON MBD.Id = BH.MasterBankId
LEFT JOIN MasterPatient MP ON MP.Id = BH.MasterPatientId
LEFT JOIN MasterTest MT ON BD.MasterTestDetailId = MT.Id
LEFT JOIN MasterCompany MC ON BH.MasterCompanyId = MC.Id
WHERE BH.InvoiceNo = @invoiceNo
END
GO

USE [master]
GO
ALTER DATABASE [Laboratoty_Dev] SET  READ_WRITE 
GO


/****** Object:  StoredProcedure [dbo].[BillDetailPrint]    Script Date: 22-09-2020 10.30.34 PPM ******/
USE [Laboratoty_Dev]
GO
/****** Object:  StoredProcedure [dbo].[BillDetailPrint]    Script Date: 22-09-2020 10.30.34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[BillDetailPrint] (@invoiceNo NVARCHAR(200))
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT BH.InvoiceNo
		,BH.InvoiceDate
		,BH.GrandTotal
		,BH.DiscountPercentage
		,BH.DiscountAmount
		,BD.Amount
		,BD.UnitPrice
		,BD.NoOfTest
		,MBD.AccountNumber
		,MBD.BankName
		,MBD.IFSCCode
		,MBD.Branch
		,MP.PatientFirstName
		,MP.PatientMiddleName
		,MP.PatientlastName
		,MT.TestName
		,MC.GSTIN
		,MC.PAN
	FROM BillHeader BH
	INNER JOIN BillDetail BD ON BH.Id = BD.BillHeaderId
	LEFT JOIN MasterBankDetail MBD ON MBD.Id = BH.MasterBankId
	LEFT JOIN MasterPatient MP ON MP.Id = BH.MasterPatientId
	LEFT JOIN MasterTest MT ON BD.MasterTestDetailId = MT.Id
	LEFT JOIN MasterCompany MC ON BH.MasterCompanyId = MC.Id
	WHERE BH.InvoiceNo = @invoiceNo
END