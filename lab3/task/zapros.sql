use Ivanov
-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE or alter TRIGGER indzad25b ON exam after insert
AS
BEGIN
DECLARE @row INT
SELECT @row = COUNT(*) FROM inserted
IF @row > 1 -- обновление нескольких записей
BEGIN
PRINT 'Вы ввели несколько записей'
ROLLBACK TRAN
RETURN -- выход из триггера
END
-- обновление одной записи

DECLARE @vmark int, @kolvo INT, @id_stud int
  
SELECT @vmark = Mark, @id_stud = Id_Student FROM inserted
IF @vmark <= 2
BEGIN
SELECT @kolvo = count(mark)  from exam where mark <= 2 and Id_Student = @id_stud

IF @kolvo >= 1
PRINT 'Студента могут отчислить ' 
END
END
