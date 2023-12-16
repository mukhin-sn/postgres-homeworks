-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE STUDENT
(
	STUDENT_ID serial,
	FIRST_NAME varchar,
	LAST_NAME varchar,
	BIRTHDAY date,
	PHONE varchar
);

-- 2. Добавить в таблицу student колонку middle_name varchar
ALTER TABLE STUDENT ADD COLUMN MIDDLE_NAME varchar

-- 3. Удалить колонку middle_name
ALTER TABLE STUDENT DROP COLUMN MIDDLE_NAME

-- 4. Переименовать колонку birthday в birth_date
ALTER TABLE STUDENT RENAME BIRTHDAY TO BIRTH_DATE

-- 5. Изменить тип данных колонки phone на varchar(32)
ALTER TABLE STUDENT
ALTER COLUMN PHONE
SET DATA TYPE VARCHAR(32)

-- 6. Вставить три любых записи с автогенерацией идентификатора
INSERT INTO STUDENT (FIRST_NAME, LAST_NAME, BIRTH_DATE, PHONE)
VALUES ('John', 'Snow', '1975-02-25', '36-02-66'),
	   ('Bruce', 'Lee', '1940-11-27', '55-55-55'),
	   ('Vasiliy', 'Pupkin', '1955-12-21', '74-70-90')

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE TABLE STUDENT RESTART IDENTITY