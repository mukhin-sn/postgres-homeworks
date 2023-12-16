-- Подключиться к БД Northwind и сделать следующие изменения:
-- 1. Добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)
ALTER TABLE PRODUCTS ADD CONSTRAINT CHK_PRODUCTS_UNIT_PRICE CHECK (UNIT_PRICE > 0)

-- 2. Добавить ограничение, что поле discontinued таблицы products может содержать только значения 0 или 1
ALTER TABLE PRODUCTS ADD CONSTRAINT CHK_PRODUCTS_DISCONTINUED CHECK (DISCONTINUED IN (0, 1))

-- 3. Создать новую таблицу, содержащую все продукты, снятые с продажи (discontinued = 1)
SELECT * INTO PRODUCTS_DISCONTINUED
FROM PRODUCTS
WHERE DISCONTINUED = 1

-- 4. Удалить из products товары, снятые с продажи (discontinued = 1)
-- Для 4-го пункта может потребоваться удаление ограничения, связанного с foreign_key. Подумайте, как это можно решить, чтобы связь с таблицей order_details все же осталась.
SELECT *
FROM ORDER_DETAILS
DELETE
FROM ORDER_DETAILS
WHERE EXISTS
		(SELECT *
			FROM PRODUCTS
			WHERE PRODUCTS.PRODUCT_ID = ORDER_DETAILS.PRODUCT_ID
				AND PRODUCTS.DISCONTINUED = 1)
DELETE
FROM PRODUCTS WHERE DISCONTINUED = 1