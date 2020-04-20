USE [master]
GO
/****** Object:  Database [Ivanov]    Script Date: 20.04.2020 19:30:13 ******/
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
/****** Object:  Table [dbo].[Exam]    Script Date: 20.04.2020 19:30:14 ******/
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
/****** Object:  Table [dbo].[Lecturer]    Script Date: 20.04.2020 19:30:14 ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 20.04.2020 19:30:14 ******/
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
/****** Object:  Table [dbo].[StudGroup]    Script Date: 20.04.2020 19:30:15 ******/
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
