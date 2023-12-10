-- Напишите запросы, которые выводят следующую информацию:
-- 1. заказы, отправленные в города, заканчивающиеся на 'burg'. Вывести без повторений две колонки (город, страна) (см. таблица orders, колонки ship_city, ship_country)
SELECT DISTINCT SHIP_CITY,
	SHIP_COUNTRY
FROM ORDERS
WHERE SHIP_CITY like '%burg'

-- 2. из таблицы orders идентификатор заказа, идентификатор заказчика, вес и страну отгрузки. Заказ отгружен в страны, начинающиеся на 'P'. Результат отсортирован по весу (по убыванию). Вывести первые 10 записей.
SELECT ORDER_ID,
	CUSTOMER_ID,
	FREIGHT,
	SHIP_COUNTRY
FROM ORDERS
WHERE SHIP_COUNTRY like 'P%'
ORDER BY FREIGHT DESC
LIMIT 10


-- 3. фамилию, имя и телефон сотрудников, у которых в данных отсутствует регион (см таблицу employees)
SELECT FIRST_NAME,
	LAST_NAME,
	HOME_PHONE
FROM EMPLOYEES
WHERE REGION IS NULL

-- 4. количество поставщиков (suppliers) в каждой из стран. Результат отсортировать по убыванию количества поставщиков в стране
SELECT COUNTRY,
	COUNT(*)
FROM SUPPLIERS
GROUP BY COUNTRY
ORDER BY COUNT(*) DESC

-- 5. суммарный вес заказов (в которых известен регион) по странам, но вывести только те результаты, где суммарный вес на страну больше 2750. Отсортировать по убыванию суммарного веса (см таблицу orders, колонки ship_region, ship_country, freight)


-- 6. страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers) и работники (employees).


-- 7. страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers), но не зарегистрированы работники (employees).
