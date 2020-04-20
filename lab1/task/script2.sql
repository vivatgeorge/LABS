USE [master]
GO
/****** Object:  Database [Ivanov]    Script Date: 20.04.2020 20:27:18 ******/
CREATE DATABASE [Ivanov]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ivanov', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Ivanov.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ivanov_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Ivanov_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Ivanov] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ivanov].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ivanov] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ivanov] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ivanov] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ivanov] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ivanov] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ivanov] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ivanov] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ivanov] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ivanov] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ivanov] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ivanov] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ivanov] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ivanov] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ivanov] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ivanov] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ivanov] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ivanov] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ivanov] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ivanov] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ivanov] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ivanov] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ivanov] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ivanov] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ivanov] SET  MULTI_USER 
GO
ALTER DATABASE [Ivanov] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ivanov] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ivanov] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ivanov] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Ivanov] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ivanov] SET QUERY_STORE = OFF
GO
USE [Ivanov]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 20.04.2020 20:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Id_Student] [int] NOT NULL,
	[Subject] [varchar](50) NOT NULL,
	[Mark] [int] NOT NULL,
	[Exam_Date] [date] NOT NULL,
	[Id_Lect] [int] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[Id_Student] ASC,
	[Subject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 20.04.2020 20:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[Id_Lect] [int] NOT NULL,
	[FIO] [varchar](50) NOT NULL,
	[Stage] [int] NOT NULL,
	[Kafedra] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[Id_Lect] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 20.04.2020 20:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id_Student] [int] NOT NULL,
	[FIO] [varchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Gender] [char](1) NOT NULL,
	[NameGroup] [varchar](10) NOT NULL,
	[Stip] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id_Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudGroup]    Script Date: 20.04.2020 20:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudGroup](
	[NameGroup] [varchar](10) NOT NULL,
	[Kurs] [int] NOT NULL,
	[Kafedra] [varchar](20) NOT NULL,
 CONSTRAINT [PK_StudGroup] PRIMARY KEY CLUSTERED 
(
	[NameGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (1, N'����������', 3, CAST(N'2019-01-21' AS Date), 1)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (1, N'������', 4, CAST(N'2018-12-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (2, N'����������', 5, CAST(N'2019-01-21' AS Date), 1)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (2, N'������', 4, CAST(N'2018-12-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (3, N'����������', 2, CAST(N'2019-12-21' AS Date), 1)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (3, N'������', 3, CAST(N'2018-12-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (4, N'����������', 4, CAST(N'2019-12-21' AS Date), 1)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (4, N'������', 4, CAST(N'2018-12-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (15, N'����', 4, CAST(N'2018-12-21' AS Date), 3)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (15, N'��', 5, CAST(N'2018-12-20' AS Date), 4)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (16, N'����', 3, CAST(N'2018-12-21' AS Date), 3)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (16, N'��', 2, CAST(N'2018-12-20' AS Date), 4)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (17, N'����', 4, CAST(N'2018-12-21' AS Date), 3)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (17, N'��', 5, CAST(N'2018-12-20' AS Date), 4)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (18, N'����', 3, CAST(N'2018-12-21' AS Date), 3)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (18, N'��', 2, CAST(N'2018-12-20' AS Date), 4)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (19, N'����', 2, CAST(N'2018-12-21' AS Date), 3)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (19, N'��', 4, CAST(N'2018-12-20' AS Date), 4)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (20, N'����', 4, CAST(N'2018-12-21' AS Date), 3)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (20, N'��', 5, CAST(N'2018-12-20' AS Date), 4)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (21, N'����', 5, CAST(N'2019-01-21' AS Date), 5)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (21, N'������', 3, CAST(N'2019-01-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (22, N'����', 4, CAST(N'2018-12-21' AS Date), 5)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (22, N'������', 2, CAST(N'2018-12-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (23, N'����', 3, CAST(N'2018-12-21' AS Date), 5)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (23, N'������', 4, CAST(N'2018-12-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (24, N'����', 5, CAST(N'2018-12-21' AS Date), 5)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (24, N'������', 4, CAST(N'2018-12-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (25, N'����', 5, CAST(N'2018-12-21' AS Date), 5)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (25, N'������', 3, CAST(N'2018-12-25' AS Date), 2)
GO
INSERT [dbo].[Lecturer] ([Id_Lect], [FIO], [Stage], [Kafedra]) VALUES (1, N'������ �.�.', 10, N'��')
INSERT [dbo].[Lecturer] ([Id_Lect], [FIO], [Stage], [Kafedra]) VALUES (2, N'������ �.�.', 5, N'��')
INSERT [dbo].[Lecturer] ([Id_Lect], [FIO], [Stage], [Kafedra]) VALUES (3, N'������ �.�.', 1, N'��')
INSERT [dbo].[Lecturer] ([Id_Lect], [FIO], [Stage], [Kafedra]) VALUES (4, N'��������� �.�.', 15, N'��')
INSERT [dbo].[Lecturer] ([Id_Lect], [FIO], [Stage], [Kafedra]) VALUES (5, N'������ �.�.', 20, N'���')
GO
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (1, N'����� �.�.', CAST(N'1998-01-01' AS Date), N'�', N'�-12-01', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (2, N'�������� �.�', CAST(N'1998-02-21' AS Date), N'�', N'�-12-01', 2000)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (3, N'��������� �.�.', CAST(N'1998-01-14' AS Date), N'�', N'�-12-01', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (4, N'�������� �.�.', CAST(N'1998-10-23' AS Date), N'�', N'�-12-01', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (5, N'��������� �.�.', CAST(N'1998-05-16' AS Date), N'�', N'�-12-01', 2500)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (6, N'������ �.�.', CAST(N'1998-03-11' AS Date), N'�', N'�-12-02', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (7, N'��������� �.�.', CAST(N'1998-11-04' AS Date), N'�', N'�-12-02', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (8, N'������ �.�.', CAST(N'1998-02-13' AS Date), N'�', N'�-12-02', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (9, N'������ �.�.', CAST(N'1998-12-25' AS Date), N'�', N'�-12-02', 2000)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (10, N'������ �.�.', CAST(N'1998-08-11' AS Date), N'�', N'�-12-02', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (11, N'�������� �.�.', CAST(N'1999-06-10' AS Date), N'�', N'�-13-10', 2500)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (12, N'�������� �.�.', CAST(N'1999-12-06' AS Date), N'�', N'�-13-10', 2000)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (13, N'������� �.�.', CAST(N'1999-11-30' AS Date), N'�', N'�-13-10', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (14, N'������� �.�.', CAST(N'1999-02-15' AS Date), N'�', N'�-13-10', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (15, N'������ �.�.', CAST(N'1999-12-01' AS Date), N'�', N'�-13-10', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (16, N'������� �.�.', CAST(N'1998-02-16' AS Date), N'�', N'���-12-02', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (17, N'�������� �.�.', CAST(N'1998-11-14' AS Date), N'�', N'���-12-02', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (18, N'�������� �.�.', CAST(N'1998-10-10' AS Date), N'�', N'���-12-02', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (19, N'������� �.�.', CAST(N'1998-06-25' AS Date), N'�', N'���-12-02', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (20, N'������� �.�.', CAST(N'1998-10-02' AS Date), N'�', N'���-12-02', 2000)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (21, N'��������� �.�.', CAST(N'1998-12-17' AS Date), N'�', N'���-17-06', 2000)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (22, N'����� �.�.', CAST(N'1998-01-21' AS Date), N'�', N'���-17-06', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (23, N'������ �.�.', CAST(N'1998-03-06' AS Date), N'�', N'���-17-06', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (24, N'��������� �.�.', CAST(N'1998-09-15' AS Date), N'�', N'���-17-06', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (25, N'����� �.�.', CAST(N'1997-11-12' AS Date), N'�', N'���-17-06', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (26, N'������ �.�.', CAST(N'1997-10-11' AS Date), N'�', N'���-16-05', 2000)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (27, N'������� �.�.', CAST(N'1997-09-12' AS Date), N'�', N'���-16-05', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (28, N'������ �.�.', CAST(N'1997-07-01' AS Date), N'�', N'���-16-05', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (29, N'�������� �.�.', CAST(N'1997-12-25' AS Date), N'�', N'���-16-05', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (30, N'������ �.�.', CAST(N'1997-01-21' AS Date), N'�', N'���-16-05', NULL)
GO
INSERT [dbo].[StudGroup] ([NameGroup], [Kurs], [Kafedra]) VALUES (N'�-12-01', 3, N'��')
INSERT [dbo].[StudGroup] ([NameGroup], [Kurs], [Kafedra]) VALUES (N'�-12-02', 3, N'��')
INSERT [dbo].[StudGroup] ([NameGroup], [Kurs], [Kafedra]) VALUES (N'�-13-10', 2, N'��')
INSERT [dbo].[StudGroup] ([NameGroup], [Kurs], [Kafedra]) VALUES (N'���-12-02', 3, N'��')
INSERT [dbo].[StudGroup] ([NameGroup], [Kurs], [Kafedra]) VALUES (N'���-17-06', 3, N'��')
INSERT [dbo].[StudGroup] ([NameGroup], [Kurs], [Kafedra]) VALUES (N'���-16-05', 4, N'���')
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Lecturer1] FOREIGN KEY([Id_Lect])
REFERENCES [dbo].[Lecturer] ([Id_Lect])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Lecturer1]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Student1] FOREIGN KEY([Id_Student])
REFERENCES [dbo].[Student] ([Id_Student])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Student1]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_StudGroup1] FOREIGN KEY([NameGroup])
REFERENCES [dbo].[StudGroup] ([NameGroup])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_StudGroup1]
GO
USE [master]
GO
ALTER DATABASE [Ivanov] SET  READ_WRITE 
GO
