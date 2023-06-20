-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE student
(
	student_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar
);
SELECT * FROM student

-- 2. Добавить в таблицу student колонку middle_name varchar
ALTER TABLE student ADD COLUMN middle_name varchar;
SELECT * FROM student

-- 3. Удалить колонку middle_name
ALTER TABLE student DROP COLUMN middle_name;
SELECT * FROM student

-- 4. Переименовать колонку birthday в birth_date
ALTER TABLE student RENAME birthday TO birth_date;
SELECT * FROM student

-- 5. Изменить тип данных колонки phone на varchar(32)
ALTER TABLE student ALTER COLUMN phone SET DATA TYPE varchar(32);
SELECT * FROM student

-- 6. Вставить три любых записи с автогенерацией идентификатора
INSERT INTO student (first_name, last_name, birth_date, phone)
VALUES 	('Матвей', 'Иванов', '11-11-2000', '123456789'),
 		('Иван', 'Петров', '10-10-2001', '987654321'),
 		('Илья', 'Сидоров', '12-12-2003', '456789123')
;
SELECT * FROM student

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE TABLE student;
SELECT * FROM student
