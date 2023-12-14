-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)
SELECT CUSTOMERS.COMPANY_NAME AS CUSTOMER,
	CONCAT(FIRST_NAME,' ', LAST_NAME) AS EMPLOYEE
FROM CUSTOMERS
JOIN ORDERS USING(CUSTOMER_ID)
JOIN EMPLOYEES USING(EMPLOYEE_ID)
JOIN SHIPPERS ON ORDERS.SHIP_VIA = SHIPPERS.SHIPPER_ID
WHERE CUSTOMERS.CITY = 'London'
	AND EMPLOYEES.CITY = 'London'
	AND SHIPPERS.COMPANY_NAME = 'United Package'

-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.
SELECT PRODUCT_NAME,
	UNITS_IN_STOCK,
	CONTACT_NAME,
	PHONE
FROM PRODUCTS
JOIN SUPPLIERS USING(SUPPLIER_ID)
JOIN CATEGORIES USING(CATEGORY_ID)
WHERE PRODUCTS.DISCONTINUED = 0
	AND PRODUCTS.UNITS_IN_STOCK < 25
	AND CATEGORIES.CATEGORY_NAME IN ('Dairy Products', 'Condiments')
ORDER BY UNITS_IN_STOCK

-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа
SELECT COMPANY_NAME
FROM CUSTOMERS
LEFT JOIN ORDERS USING(CUSTOMER_ID)
WHERE ORDER_DATE IS NULL
ORDER BY COMPANY_NAME

-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.
SELECT DISTINCT PRODUCT_NAME
FROM PRODUCTS
WHERE EXISTS (SELECT * FROM ORDER_DETAILS
			  WHERE PRODUCTS.PRODUCT_ID = ORDER_DETAILS.PRODUCT_ID
			  AND ORDER_DETAILS.QUANTITY = 10)
ORDER BY PRODUCT_NAME
