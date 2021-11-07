USE [master]
GO
/****** Object:  Database [SWP490_G37]    Script Date: 11/8/2021 12:41:23 AM ******/
CREATE DATABASE [SWP490_G37]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP490_G37', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DUCPHUONG\MSSQL\DATA\SWP490_G37.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP490_G37_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DUCPHUONG\MSSQL\DATA\SWP490_G37_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SWP490_G37] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP490_G37].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP490_G37] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP490_G37] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP490_G37] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP490_G37] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP490_G37] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP490_G37] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP490_G37] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP490_G37] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP490_G37] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP490_G37] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP490_G37] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP490_G37] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP490_G37] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP490_G37] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP490_G37] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP490_G37] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP490_G37] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP490_G37] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP490_G37] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP490_G37] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP490_G37] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP490_G37] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP490_G37] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP490_G37] SET  MULTI_USER 
GO
ALTER DATABASE [SWP490_G37] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP490_G37] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP490_G37] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP490_G37] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP490_G37] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP490_G37] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWP490_G37', N'ON'
GO
ALTER DATABASE [SWP490_G37] SET QUERY_STORE = OFF
GO
USE [SWP490_G37]
GO
/****** Object:  Table [dbo].[ACADEMIC_HEAD]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACADEMIC_HEAD](
	[ADID] [int] NOT NULL,
	[ADName] [nvarchar](100) NULL,
	[Mcontact] [nvarchar](200) NULL,
	[Maddress] [nvarchar](200) NULL,
	[Gender] [smallint] NULL,
	[Date_of_birth] [nvarchar](10) NULL,
	[Teacher_id] [int] NULL,
	[Mid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ADID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[AccID] [int] NOT NULL,
	[Username] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACCOUNT_ROLES]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNT_ROLES](
	[Account_AccID] [int] NULL,
	[Roles_RoleID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ADMINITRATOR]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMINITRATOR](
	[Adid] [int] NOT NULL,
	[First_name] [nvarchar](100) NULL,
	[Last_name] [nvarchar](100) NULL,
	[Middle_name] [nvarchar](100) NULL,
	[Date_of_birth] [nvarchar](10) NULL,
	[Admin_address] [nvarchar](200) NULL,
	[Mcontact] [nvarchar](200) NULL,
	[Page] [int] NULL,
	[Gender] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Adid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] NOT NULL,
	[PName] [nvarchar](100) NULL,
	[ClassName] [nvarchar](200) NULL,
	[Date_from] [nvarchar](10) NULL,
	[Date_to] [nvarchar](10) NULL,
	[Teacher_id] [int] NULL,
	[ADID] [int] NULL,
	[Mater_ID] [int] NULL,
	[Tuid] [int] NULL,
	[Time_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EXAM]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXAM](
	[Exam_ID] [int] NOT NULL,
	[Subid] [int] NULL,
	[Pid] [int] NULL,
	[SubName] [nvarchar](100) NULL,
	[ExamName] [nvarchar](100) NULL,
	[PName] [nvarchar](100) NULL,
	[Mark] [decimal](4, 2) NULL,
	[Teacher_id] [int] NULL,
	[ClassID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EXERCISE]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXERCISE](
	[EID] [int] NOT NULL,
	[Subid] [int] NULL,
	[Teacher_id] [int] NULL,
	[Mark] [decimal](4, 2) NULL,
	[Sub_name] [nvarchar](100) NULL,
	[Pname] [nvarchar](100) NULL,
	[Pid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HEADMASTER]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HEADMASTER](
	[Mid] [int] NOT NULL,
	[Mname] [nvarchar](100) NULL,
	[Maddress] [nvarchar](200) NULL,
	[Mcontact] [nvarchar](200) NULL,
	[AccID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Mid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOMEWORK]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOMEWORK](
	[HomeworkID] [int] NOT NULL,
	[Pid] [int] NULL,
	[SubName] [nvarchar](100) NULL,
	[PName] [nvarchar](100) NULL,
	[Date_Create] [nvarchar](10) NULL,
	[Other_homeworkdetail] [nvarchar](100) NULL,
	[ADID] [int] NULL,
	[Teacher_id] [int] NULL,
	[Subid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[HomeworkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARKBOOK]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARKBOOK](
	[Mark_id] [int] NOT NULL,
	[Pid] [int] NULL,
	[Subid] [int] NULL,
	[Subname] [nvarchar](100) NULL,
	[Pname] [nvarchar](100) NULL,
	[Point] [decimal](4, 2) NULL,
	[Teacher_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Mark_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MATERIALS]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATERIALS](
	[Mater_ID] [int] NOT NULL,
	[Teacher_id] [int] NULL,
	[Class_ID] [int] NULL,
	[Class_Name] [nvarchar](100) NULL,
	[Mater_name] [nvarchar](100) NULL,
	[ADID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Mater_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PUPIL_PARENT]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUPIL_PARENT](
	[Pid] [int] NOT NULL,
	[ClassID] [int] NULL,
	[First_name] [nvarchar](100) NULL,
	[Last_name] [nvarchar](100) NULL,
	[Middle_name] [nvarchar](100) NULL,
	[Date_of_birth] [nvarchar](10) NULL,
	[Maddress] [nvarchar](200) NULL,
	[Mcontact] [nvarchar](200) NULL,
	[Page] [int] NULL,
	[Gender] [smallint] NULL,
	[AccID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLES]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLES](
	[RoleID] [int] NOT NULL,
	[RoleNAME] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STAFF]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STAFF](
	[StaffID] [int] NOT NULL,
	[StaffName] [nvarchar](100) NULL,
	[StaffAddress] [nvarchar](200) NULL,
	[Staffcontact] [nvarchar](200) NULL,
	[Gender] [smallint] NULL,
	[Date_of_birth] [nvarchar](10) NULL,
	[AccID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBJECT]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBJECT](
	[Subid] [int] NOT NULL,
	[Teacher_id] [int] NULL,
	[SubName] [nvarchar](100) NULL,
	[ADID] [int] NULL,
	[Exam_id] [int] NULL,
	[ClassID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TEACHER]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEACHER](
	[Teacher_id] [int] NOT NULL,
	[First_name] [nvarchar](100) NULL,
	[Middle_name] [nvarchar](200) NULL,
	[Last_name] [nvarchar](200) NULL,
	[Date_of_birth] [nvarchar](10) NULL,
	[Gender] [smallint] NULL,
	[Teacher_address] [nvarchar](200) NULL,
	[Teacher_Contact] [nvarchar](200) NULL,
	[AccID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIMETABLE]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIMETABLE](
	[Time_id] [int] NOT NULL,
	[Subid] [int] NULL,
	[Teacher_id] [int] NULL,
	[Time_start] [nvarchar](10) NULL,
	[Time_end] [nvarchar](10) NULL,
	[Day] [date] NULL,
	[ClassID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Time_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TUITIONFEE]    Script Date: 11/8/2021 12:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TUITIONFEE](
	[Tuid] [int] NOT NULL,
	[Subid] [int] NULL,
	[Subname] [nvarchar](100) NULL,
	[Price] [decimal](10, 2) NULL,
	[Date] [nvarchar](10) NULL,
	[StudentId] [int] NULL,
	[Mid] [int] NULL,
	[StaffID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Tuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ACADEMIC_HEAD] ([ADID], [ADName], [Mcontact], [Maddress], [Gender], [Date_of_birth], [Teacher_id], [Mid]) VALUES (1, N'Ha Trang', N'0945123788', N'Ha Noi', 1, N'12/02/1992', NULL, NULL)
INSERT [dbo].[ACADEMIC_HEAD] ([ADID], [ADName], [Mcontact], [Maddress], [Gender], [Date_of_birth], [Teacher_id], [Mid]) VALUES (2, N'Quang Dang', N'0945123277', N'Ha Noi', 2, N'12/02/1990', NULL, NULL)
GO
INSERT [dbo].[ACCOUNT] ([AccID], [Username], [Password]) VALUES (1, N'Teacher', N'Teacher')
INSERT [dbo].[ACCOUNT] ([AccID], [Username], [Password]) VALUES (2, N'Admin', N'Admin')
INSERT [dbo].[ACCOUNT] ([AccID], [Username], [Password]) VALUES (3, N'Staff', N'Staff')
INSERT [dbo].[ACCOUNT] ([AccID], [Username], [Password]) VALUES (4, N'Headmaster', N'Headmaster')
INSERT [dbo].[ACCOUNT] ([AccID], [Username], [Password]) VALUES (5, N'Pupil_parent', N'Pupil_parent')
INSERT [dbo].[ACCOUNT] ([AccID], [Username], [Password]) VALUES (6, N'Academic_head', N'Academic_head')
INSERT [dbo].[ACCOUNT] ([AccID], [Username], [Password]) VALUES (7, N'Teacher2', N'Teacher2')
GO
INSERT [dbo].[ACCOUNT_ROLES] ([Account_AccID], [Roles_RoleID]) VALUES (1, 5)
INSERT [dbo].[ACCOUNT_ROLES] ([Account_AccID], [Roles_RoleID]) VALUES (2, 1)
INSERT [dbo].[ACCOUNT_ROLES] ([Account_AccID], [Roles_RoleID]) VALUES (3, 3)
INSERT [dbo].[ACCOUNT_ROLES] ([Account_AccID], [Roles_RoleID]) VALUES (4, 4)
INSERT [dbo].[ACCOUNT_ROLES] ([Account_AccID], [Roles_RoleID]) VALUES (5, 6)
INSERT [dbo].[ACCOUNT_ROLES] ([Account_AccID], [Roles_RoleID]) VALUES (7, 5)
GO
INSERT [dbo].[ADMINITRATOR] ([Adid], [First_name], [Last_name], [Middle_name], [Date_of_birth], [Admin_address], [Mcontact], [Page], [Gender]) VALUES (1, N'Phuong', N'Lam', N'Duc', N'08/05/1998', N'Ha Noi', N'0966151921', 26, 2)
GO
INSERT [dbo].[HEADMASTER] ([Mid], [Mname], [Maddress], [Mcontact], [AccID]) VALUES (1, N'Nguyen Duc Nhan', N'Ha Noi', N'0966151999', 4)
GO
INSERT [dbo].[MATERIALS] ([Mater_ID], [Teacher_id], [Class_ID], [Class_Name], [Mater_name], [ADID]) VALUES (1, 3, 1, N'Lop 1A', N'Tai lieu mon Van ', NULL)
INSERT [dbo].[MATERIALS] ([Mater_ID], [Teacher_id], [Class_ID], [Class_Name], [Mater_name], [ADID]) VALUES (2, 3, 1, N'Lop 1A', N'Tai lieu mon Toan ', NULL)
INSERT [dbo].[MATERIALS] ([Mater_ID], [Teacher_id], [Class_ID], [Class_Name], [Mater_name], [ADID]) VALUES (3, 3, 1, N'Lop 1A', N'Tai lieu mon Tieng Anh ', NULL)
GO
INSERT [dbo].[PUPIL_PARENT] ([Pid], [ClassID], [First_name], [Last_name], [Middle_name], [Date_of_birth], [Maddress], [Mcontact], [Page], [Gender], [AccID]) VALUES (1, NULL, N'Tuan', N'Huu', N'Tran ', N'02/12/2012', N'Ha Noi', N'0973573668', 10, 2, NULL)
INSERT [dbo].[PUPIL_PARENT] ([Pid], [ClassID], [First_name], [Last_name], [Middle_name], [Date_of_birth], [Maddress], [Mcontact], [Page], [Gender], [AccID]) VALUES (2, NULL, N'Duy Anh', N'Công ', N'Nguyễn ', N'04/11/2012', N'Ha Noi', N'0973123668', 10, 2, NULL)
INSERT [dbo].[PUPIL_PARENT] ([Pid], [ClassID], [First_name], [Last_name], [Middle_name], [Date_of_birth], [Maddress], [Mcontact], [Page], [Gender], [AccID]) VALUES (3, NULL, N'Gia Bảo', N'Ngọc ', N'Nguyễn ', N'02/02/2012', N'Ha Noi', N'0973573343', 10, 1, NULL)
INSERT [dbo].[PUPIL_PARENT] ([Pid], [ClassID], [First_name], [Last_name], [Middle_name], [Date_of_birth], [Maddress], [Mcontact], [Page], [Gender], [AccID]) VALUES (4, NULL, N'Kim Chi', N'Thị ', N'Nguyễn ', N'12/12/2012', N'Ha Noi', N'0973573012', 10, 1, NULL)
INSERT [dbo].[PUPIL_PARENT] ([Pid], [ClassID], [First_name], [Last_name], [Middle_name], [Date_of_birth], [Maddress], [Mcontact], [Page], [Gender], [AccID]) VALUES (5, NULL, N'Hưng', N'Khải ', N'Trần ', N'09/12/2012', N'Ha Noi', N'0973098678', 10, 2, NULL)
INSERT [dbo].[PUPIL_PARENT] ([Pid], [ClassID], [First_name], [Last_name], [Middle_name], [Date_of_birth], [Maddress], [Mcontact], [Page], [Gender], [AccID]) VALUES (6, NULL, N'Minh', N'Tiến ', N'Nguyễn ', N'01/08/2012', N'Ha Noi', N'0973123451', 10, 2, NULL)
INSERT [dbo].[PUPIL_PARENT] ([Pid], [ClassID], [First_name], [Last_name], [Middle_name], [Date_of_birth], [Maddress], [Mcontact], [Page], [Gender], [AccID]) VALUES (7, NULL, N'Long', N'Gia ', N'Nguyễn ', N'01/10/2012', N'Ha Noi', N'0973515155', 10, 2, NULL)
INSERT [dbo].[PUPIL_PARENT] ([Pid], [ClassID], [First_name], [Last_name], [Middle_name], [Date_of_birth], [Maddress], [Mcontact], [Page], [Gender], [AccID]) VALUES (8, NULL, N'Ngân', N'Kim ', N'Trần ', N'02/01/2012', N'Ha Noi', N'0973571234', 10, 1, NULL)
INSERT [dbo].[PUPIL_PARENT] ([Pid], [ClassID], [First_name], [Last_name], [Middle_name], [Date_of_birth], [Maddress], [Mcontact], [Page], [Gender], [AccID]) VALUES (9, NULL, N'Thành', N'Văn ', N'Nguyễn ', N'09/05/2012', N'Ha Noi', N'0973666668', 10, 2, NULL)
INSERT [dbo].[PUPIL_PARENT] ([Pid], [ClassID], [First_name], [Last_name], [Middle_name], [Date_of_birth], [Maddress], [Mcontact], [Page], [Gender], [AccID]) VALUES (10, NULL, N'My', N'Hà ', N'Nguyễn ', N'10/03/2012', N'Ha Noi', N'0973234268', 10, 1, NULL)
GO
INSERT [dbo].[ROLES] ([RoleID], [RoleNAME]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[ROLES] ([RoleID], [RoleNAME]) VALUES (2, N'ROLE_GUEST')
INSERT [dbo].[ROLES] ([RoleID], [RoleNAME]) VALUES (3, N'ROLE_STAFF')
INSERT [dbo].[ROLES] ([RoleID], [RoleNAME]) VALUES (4, N'ROLE_HEADMASTER')
INSERT [dbo].[ROLES] ([RoleID], [RoleNAME]) VALUES (5, N'ROLE_TEACHER')
INSERT [dbo].[ROLES] ([RoleID], [RoleNAME]) VALUES (6, N'ROLE_PUPIL_PARENT')
INSERT [dbo].[ROLES] ([RoleID], [RoleNAME]) VALUES (7, N'ROLE_ACADEMIC_HEAD')
GO
INSERT [dbo].[STAFF] ([StaffID], [StaffName], [StaffAddress], [Staffcontact], [Gender], [Date_of_birth], [AccID]) VALUES (1, N'Kim Anh', N'Ha Noi', N'0966151092', 1, N'01/02/1989', NULL)
INSERT [dbo].[STAFF] ([StaffID], [StaffName], [StaffAddress], [Staffcontact], [Gender], [Date_of_birth], [AccID]) VALUES (2, N'Ha Ngân', N'Ha Noi', N'0966151092', 1, N'08/06/1985', NULL)
GO
INSERT [dbo].[SUBJECT] ([Subid], [Teacher_id], [SubName], [ADID], [Exam_id], [ClassID]) VALUES (1, 1, N'Toan', NULL, NULL, NULL)
INSERT [dbo].[SUBJECT] ([Subid], [Teacher_id], [SubName], [ADID], [Exam_id], [ClassID]) VALUES (2, 2, N'Van', NULL, NULL, NULL)
INSERT [dbo].[SUBJECT] ([Subid], [Teacher_id], [SubName], [ADID], [Exam_id], [ClassID]) VALUES (3, 3, N'Anh', NULL, NULL, NULL)
GO
INSERT [dbo].[TEACHER] ([Teacher_id], [First_name], [Middle_name], [Last_name], [Date_of_birth], [Gender], [Teacher_address], [Teacher_Contact], [AccID]) VALUES (1, N'Lan', N'Thi', N'Nguyen', N'08/05/1991', 1, N'Ha Noi', N'0966151999', 1)
INSERT [dbo].[TEACHER] ([Teacher_id], [First_name], [Middle_name], [Last_name], [Date_of_birth], [Gender], [Teacher_address], [Teacher_Contact], [AccID]) VALUES (2, N'Thang', N'Duc', N'Pham', N'12/04/1992', 2, N'Thai Binh', N'0977712334', 1)
INSERT [dbo].[TEACHER] ([Teacher_id], [First_name], [Middle_name], [Last_name], [Date_of_birth], [Gender], [Teacher_address], [Teacher_Contact], [AccID]) VALUES (3, N'Nguyet', N'Thi', N'Nguyet', N'21/01/1990', 1, N'Ha Noi', N'0969320746', 1)
GO
ALTER TABLE [dbo].[ACADEMIC_HEAD]  WITH CHECK ADD FOREIGN KEY([Teacher_id])
REFERENCES [dbo].[TEACHER] ([Teacher_id])
GO
ALTER TABLE [dbo].[ACADEMIC_HEAD]  WITH CHECK ADD FOREIGN KEY([Mid])
REFERENCES [dbo].[HEADMASTER] ([Mid])
GO
ALTER TABLE [dbo].[ACCOUNT_ROLES]  WITH CHECK ADD FOREIGN KEY([Account_AccID])
REFERENCES [dbo].[ACCOUNT] ([AccID])
GO
ALTER TABLE [dbo].[ACCOUNT_ROLES]  WITH CHECK ADD FOREIGN KEY([Roles_RoleID])
REFERENCES [dbo].[ROLES] ([RoleID])
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([ADID])
REFERENCES [dbo].[ACADEMIC_HEAD] ([ADID])
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([Mater_ID])
REFERENCES [dbo].[MATERIALS] ([Mater_ID])
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([Teacher_id])
REFERENCES [dbo].[TEACHER] ([Teacher_id])
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([Time_id])
REFERENCES [dbo].[TIMETABLE] ([Time_id])
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([Tuid])
REFERENCES [dbo].[TUITIONFEE] ([Tuid])
GO
ALTER TABLE [dbo].[EXAM]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[EXAM]  WITH CHECK ADD FOREIGN KEY([Teacher_id])
REFERENCES [dbo].[TEACHER] ([Teacher_id])
GO
ALTER TABLE [dbo].[EXERCISE]  WITH CHECK ADD FOREIGN KEY([Pid])
REFERENCES [dbo].[PUPIL_PARENT] ([Pid])
GO
ALTER TABLE [dbo].[EXERCISE]  WITH CHECK ADD FOREIGN KEY([Teacher_id])
REFERENCES [dbo].[TEACHER] ([Teacher_id])
GO
ALTER TABLE [dbo].[HEADMASTER]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[ACCOUNT] ([AccID])
GO
ALTER TABLE [dbo].[HOMEWORK]  WITH CHECK ADD FOREIGN KEY([ADID])
REFERENCES [dbo].[ACADEMIC_HEAD] ([ADID])
GO
ALTER TABLE [dbo].[HOMEWORK]  WITH CHECK ADD FOREIGN KEY([Subid])
REFERENCES [dbo].[SUBJECT] ([Subid])
GO
ALTER TABLE [dbo].[HOMEWORK]  WITH CHECK ADD FOREIGN KEY([Teacher_id])
REFERENCES [dbo].[TEACHER] ([Teacher_id])
GO
ALTER TABLE [dbo].[MARKBOOK]  WITH CHECK ADD FOREIGN KEY([Pid])
REFERENCES [dbo].[PUPIL_PARENT] ([Pid])
GO
ALTER TABLE [dbo].[MARKBOOK]  WITH CHECK ADD FOREIGN KEY([Teacher_id])
REFERENCES [dbo].[TEACHER] ([Teacher_id])
GO
ALTER TABLE [dbo].[MATERIALS]  WITH CHECK ADD FOREIGN KEY([ADID])
REFERENCES [dbo].[ACADEMIC_HEAD] ([ADID])
GO
ALTER TABLE [dbo].[MATERIALS]  WITH CHECK ADD FOREIGN KEY([Teacher_id])
REFERENCES [dbo].[TEACHER] ([Teacher_id])
GO
ALTER TABLE [dbo].[PUPIL_PARENT]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[ACCOUNT] ([AccID])
GO
ALTER TABLE [dbo].[PUPIL_PARENT]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[STAFF]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[ACCOUNT] ([AccID])
GO
ALTER TABLE [dbo].[SUBJECT]  WITH CHECK ADD FOREIGN KEY([ADID])
REFERENCES [dbo].[ACADEMIC_HEAD] ([ADID])
GO
ALTER TABLE [dbo].[SUBJECT]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[SUBJECT]  WITH CHECK ADD FOREIGN KEY([Exam_id])
REFERENCES [dbo].[EXAM] ([Exam_ID])
GO
ALTER TABLE [dbo].[TEACHER]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[ACCOUNT] ([AccID])
GO
ALTER TABLE [dbo].[TIMETABLE]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[TIMETABLE]  WITH CHECK ADD FOREIGN KEY([Teacher_id])
REFERENCES [dbo].[TEACHER] ([Teacher_id])
GO
ALTER TABLE [dbo].[TUITIONFEE]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[STAFF] ([StaffID])
GO
ALTER TABLE [dbo].[TUITIONFEE]  WITH CHECK ADD FOREIGN KEY([Mid])
REFERENCES [dbo].[HEADMASTER] ([Mid])
GO
USE [master]
GO
ALTER DATABASE [SWP490_G37] SET  READ_WRITE 
GO
