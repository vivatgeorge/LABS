USE Ivanov
-- объ€вление курсора min_mark_cursor с минимальными оценками
DECLARE min_mark_cursor CURSOR LOCAL FORWARD_ONLY STATIC
FOR SELECT Id_student, MIN(Mark), MAX(Mark)
FROM Exam GROUP BY Id_student
OPEN min_mark_cursor
-- определить таблицу дл€ хранени€ результатов
DECLARE @stp_table TABLE (id INT, stp INT)
-- объ€вление локальных переменных дл€ FETCH
DECLARE @id INT, @x_min INT, @x_max INT
FETCH NEXT FROM min_mark_cursor INTO @id, @x_min, @x_max
WHILE @@FETCH_STATUS = 0
BEGIN
IF @x_min<4 INSERT INTO @stp_table VALUES (@id, 0)
IF @x_min=4 and @x_max=4 INSERT INTO @stp_table VALUES (@id, 3200)
IF @x_min=4 and @x_max=5 INSERT INTO @stp_table VALUES (@id, 4000)
IF @x_min=5 INSERT INTO @stp_table VALUES (@id, 5000)
FETCH NEXT FROM min_mark_cursor INTO @id, @x_min, @x_max
end
-- вывести результаты
CLOSE min_mark_cursor
DEALLOCATE min_mark_cursor
SELECT * FROM @stp_table
