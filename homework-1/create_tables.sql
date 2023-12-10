-- SQL-команды для создания таблиц

CREATE TABLE employees
(
	employee_id int PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50),
	title varchar(50),
	birth_date date,
	notes text
);

CREATE TABLE customers
(
	customer_id char(5),
	company_name varchar(100),
	contact_name varchar(50)
);

CREATE TABLE orders
(
	order_id int,
	customer_id char(5),
	employee_id int,
	order_date date,
	ship_city varchar(50)
)
