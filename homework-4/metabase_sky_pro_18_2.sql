-- 1 - Задача
-- Необходимо удалить все строки из таблицы temp_students, у которых id > 1000.
-- Создать таблицу students_[Фамилия и инициалы]  в схеме lesson_8 с полями
--id  (тип int),
--student_firstname (тип varchar, размерность 50),
--student_lastname (тип varchar, размерность 50).

--Решение
CREATE TABLE lesson_8.students_[Фамилия и инициалы]
(
    id int,
    student_firstname varchar(50),
    student_lastname varchar(50)
);

--Выше указан код создания таблицы, который для каждого ученика должен быть уникальным.
--Схема для тренировок у нас одна — lesson_8. В других схемах создавать таблицы запрещено.
--Мы не сможем создать в одной схеме две таблицы с одинаковыми именами,
--поэтому в конце названия через _ напишите ваши фамилию и инициалы на латинице.

--У Иванова Матвея Поликарповича получилась бы следующая инструкция:

CREATE TABLE lesson_8.students_ivanovmp
(
    id int,
    student_firstname varchar(50),
    student_lastname varchar(50)
);

--Теперь сделайте запрос к этой таблице.

--Metabase скажет, что нет результатов. Поэтому нам придется, забегая вперед, добавить одну строку с помощью INSERT:

INSERT INTO lesson_8.students_ivanovmp
(
    id,
    student_firstname,
    student_lastname
)
VALUES (1, 'Матвей', 'Иванов');

--Про вставку в таблицу с помощью INSERT узнаем далее.
--Сделайте запрос к таблице повторно.
--Вы увидите три значения, которые мы только что добавили. Дальнейшие действия мы будем проводить именно с этой таблицей.

-- 2 - Задача
--Необходимо добавить в созданную ранее таблицу поле student_age с числовым типом (int) и переименовать таблицу в
--lesson_8.students_full_[Фамилия и инициалы].

--Решение
--Выполняйте команды поочередно. Это можно сделать, выделив сначала первое предложение и нажав Ctrl + Enter.

ALTER TABLE lesson_8.students_ivanovmp ADD COLUMN student_age int;
ALTER TABLE lesson_8.students_ivanovmp RENAME TO lesson_8.students_full_ivanovmp;

-- 3 - Задача
--Удалить таблицу lesson_8.students_full_[Фамилия и инициалы].

--Решение
DROP TABLE lesson_8.students_full_ivanovmp;
