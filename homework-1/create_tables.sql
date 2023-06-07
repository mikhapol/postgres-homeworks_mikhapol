-- SQL-команды для создания таблиц

CREATE TABLE employees  -- Сотрудники
(
	employee_id int PRIMARY KEY,                                    -- Порядковый номер сотруника
	first_name varchar(100) NOT NULL,                               -- Имя
	last_name varchar(100) NOT NULL,                                -- Фамилия
	title varchar(100),                                             -- Должность
	birth_date date,                                                -- Дата рождения
	notes text                                                      -- О сотруднике и его достижениях
);

CREATE TABLE customers  -- Клиенты
(
	customer_id varchar(5) PRIMARY KEY,                             -- Идентификационное имя клиента
	company_name varchar(50) NOT NULL,                              -- Фирма (наименование компании)
	contact_name varchar(50) NOT NULL                               -- Имя представителя фирмы
);

CREATE TABLE orders     -- Заказы
(
	order_id int PRIMARY KEY,                                       -- Идентификационный номер заказа
	customer_id varchar(100) REFERENCES customers(customer_id),     -- Идентификационное имя клиента
	employee_id int REFERENCES employees(employee_id),              -- Порядковый номер сотруника
	order_date date NOT NULL,                                       -- Дата заказа
	ship_city varchar(100)                                          -- Город заказа
);

SELECT * from employees
SELECT * from customers
SELECT * from orders
