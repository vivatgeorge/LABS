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
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (1, N'Математика', 3, CAST(N'2019-01-21' AS Date), 1)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (1, N'Физика', 4, CAST(N'2018-12-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (2, N'Математика', 5, CAST(N'2019-01-21' AS Date), 1)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (2, N'Физика', 4, CAST(N'2018-12-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (3, N'Математика', 2, CAST(N'2019-12-21' AS Date), 1)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (3, N'Физика', 3, CAST(N'2018-12-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (4, N'Математика', 4, CAST(N'2019-12-21' AS Date), 1)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (4, N'Физика', 4, CAST(N'2018-12-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (15, N'ИИЕС', 4, CAST(N'2018-12-21' AS Date), 3)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (15, N'УД', 5, CAST(N'2018-12-20' AS Date), 4)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (16, N'ИИЕС', 3, CAST(N'2018-12-21' AS Date), 3)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (16, N'УД', 2, CAST(N'2018-12-20' AS Date), 4)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (17, N'ИИЕС', 4, CAST(N'2018-12-21' AS Date), 3)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (17, N'УД', 5, CAST(N'2018-12-20' AS Date), 4)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (18, N'ИИЕС', 3, CAST(N'2018-12-21' AS Date), 3)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (18, N'УД', 2, CAST(N'2018-12-20' AS Date), 4)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (19, N'ИИЕС', 2, CAST(N'2018-12-21' AS Date), 3)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (19, N'УД', 4, CAST(N'2018-12-20' AS Date), 4)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (20, N'ИИЕС', 4, CAST(N'2018-12-21' AS Date), 3)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (20, N'УД', 5, CAST(N'2018-12-20' AS Date), 4)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (21, N'САПР', 5, CAST(N'2019-01-21' AS Date), 5)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (21, N'Физика', 3, CAST(N'2019-01-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (22, N'САПР', 4, CAST(N'2018-12-21' AS Date), 5)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (22, N'Физика', 2, CAST(N'2018-12-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (23, N'САПР', 3, CAST(N'2018-12-21' AS Date), 5)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (23, N'Физика', 4, CAST(N'2018-12-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (24, N'САПР', 5, CAST(N'2018-12-21' AS Date), 5)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (24, N'Физика', 4, CAST(N'2018-12-25' AS Date), 2)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (25, N'САПР', 5, CAST(N'2018-12-21' AS Date), 5)
INSERT [dbo].[Exam] ([Id_Student], [Subject], [Mark], [Exam_Date], [Id_Lect]) VALUES (25, N'Физика', 3, CAST(N'2018-12-25' AS Date), 2)
GO
INSERT [dbo].[Lecturer] ([Id_Lect], [FIO], [Stage], [Kafedra]) VALUES (1, N'Авдеев К.А.', 10, N'ПМ')
INSERT [dbo].[Lecturer] ([Id_Lect], [FIO], [Stage], [Kafedra]) VALUES (2, N'Петров А.Д.', 5, N'ПМ')
INSERT [dbo].[Lecturer] ([Id_Lect], [FIO], [Stage], [Kafedra]) VALUES (3, N'Иванов В.С.', 1, N'ИС')
INSERT [dbo].[Lecturer] ([Id_Lect], [FIO], [Stage], [Kafedra]) VALUES (4, N'Медведева М.А.', 15, N'ИС')
INSERT [dbo].[Lecturer] ([Id_Lect], [FIO], [Stage], [Kafedra]) VALUES (5, N'Петров С.И.', 20, N'МТО')
GO
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (1, N'Агеев А.А.', CAST(N'1998-01-01' AS Date), N'м', N'А-12-01', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (2, N'Богданов В.В', CAST(N'1998-02-21' AS Date), N'м', N'А-12-01', 2000)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (3, N'Васильева А.Э.', CAST(N'1998-01-14' AS Date), N'ж', N'А-12-01', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (4, N'Голубева Ю.А.', CAST(N'1998-10-23' AS Date), N'ж', N'А-12-01', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (5, N'Демьянова В.Ю.', CAST(N'1998-05-16' AS Date), N'ж', N'А-12-01', 2500)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (6, N'Егоров П.И.', CAST(N'1998-03-11' AS Date), N'м', N'А-12-02', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (7, N'Журавлева Е.А.', CAST(N'1998-11-04' AS Date), N'ж', N'А-12-02', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (8, N'Зайцев В.С.', CAST(N'1998-02-13' AS Date), N'м', N'А-12-02', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (9, N'Ильина В.Ю.', CAST(N'1998-12-25' AS Date), N'ж', N'А-12-02', 2000)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (10, N'Климов И.П.', CAST(N'1998-08-11' AS Date), N'м', N'А-12-02', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (11, N'Левченко А.Е.', CAST(N'1999-06-10' AS Date), N'м', N'А-13-10', 2500)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (12, N'Михайлов Ю.А.', CAST(N'1999-12-06' AS Date), N'м', N'А-13-10', 2000)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (13, N'Никулин С.К.', CAST(N'1999-11-30' AS Date), N'м', N'А-13-10', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (14, N'Осипова А.С.', CAST(N'1999-02-15' AS Date), N'ж', N'А-13-10', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (15, N'Петров В.Р.', CAST(N'1999-12-01' AS Date), N'м', N'А-13-10', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (16, N'Романов В.С.', CAST(N'1998-02-16' AS Date), N'м', N'ИБД-12-02', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (17, N'Степанов К.М.', CAST(N'1998-11-14' AS Date), N'м', N'ИБД-12-02', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (18, N'Талыпина А.Н.', CAST(N'1998-10-10' AS Date), N'ж', N'ИБД-12-02', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (19, N'Ушакова А.С.', CAST(N'1998-06-25' AS Date), N'ж', N'ИБД-12-02', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (20, N'Филинов Е.К.', CAST(N'1998-10-02' AS Date), N'м', N'ИБД-12-02', 2000)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (21, N'Харитонов Р.А.', CAST(N'1998-12-17' AS Date), N'м', N'ИДБ-17-06', 2000)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (22, N'Чехов А.Н.', CAST(N'1998-01-21' AS Date), N'м', N'ИДБ-17-06', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (23, N'Шамова Ю.К.', CAST(N'1998-03-06' AS Date), N'ж', N'ИДБ-17-06', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (24, N'Васильева М.Е.', CAST(N'1998-09-15' AS Date), N'ж', N'ИДБ-17-06', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (25, N'Агеев Е.К.', CAST(N'1997-11-12' AS Date), N'м', N'ИДБ-17-06', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (26, N'Зайцев А.П.', CAST(N'1997-10-11' AS Date), N'м', N'МДБ-16-05', 2000)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (27, N'Никулин Н.А.', CAST(N'1997-09-12' AS Date), N'м', N'МДБ-16-05', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (28, N'Ильина К.Ю.', CAST(N'1997-07-01' AS Date), N'ж', N'МДБ-16-05', NULL)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (29, N'Голубева Е.М.', CAST(N'1997-12-25' AS Date), N'ж', N'МДБ-16-05', 1700)
INSERT [dbo].[Student] ([Id_Student], [FIO], [Birthday], [Gender], [NameGroup], [Stip]) VALUES (30, N'Климов К.Е.', CAST(N'1997-01-21' AS Date), N'м', N'МДБ-16-05', NULL)
GO
INSERT [dbo].[StudGroup] ([NameGroup], [Kurs], [Kafedra]) VALUES (N'А-12-01', 3, N'ПМ')
INSERT [dbo].[StudGroup] ([NameGroup], [Kurs], [Kafedra]) VALUES (N'А-12-02', 3, N'ПМ')
INSERT [dbo].[StudGroup] ([NameGroup], [Kurs], [Kafedra]) VALUES (N'А-13-10', 2, N'ПМ')
INSERT [dbo].[StudGroup] ([NameGroup], [Kurs], [Kafedra]) VALUES (N'ИБД-12-02', 3, N'ИС')
INSERT [dbo].[StudGroup] ([NameGroup], [Kurs], [Kafedra]) VALUES (N'ИДБ-17-06', 3, N'ИС')
INSERT [dbo].[StudGroup] ([NameGroup], [Kurs], [Kafedra]) VALUES (N'МДБ-16-05', 4, N'МТО')
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
