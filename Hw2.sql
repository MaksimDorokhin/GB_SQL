/* Домашняя работа №2

1. Используя операторы языка SQL, 
создайте таблицу “sales”. Заполните ее данными.
*/

USE lesson_1;
CREATE TABLE sales(
	id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);

INSERT INTO sales(order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT * FROM sales;

/*
2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ
*/

SELECT id,
	CASE 
		WHEN count_product < 100 THEN 'Маленький заказ'
        WHEN count_product BETWEEN 100 AND 300 THEN 'Средний заказ'
        WHEN count_product > 300 THEN 'Большой заказ'
	END AS 'Тип заказ'
FROM sales;

/*
3. Создайте таблицу “orders”, заполните ее значениями 
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»
*/

CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
    employee_id VARCHAR(4) UNIQUE NOT NULL,
    amount DECIMAL(6,2) NOT NULL,
    order_status VARCHAR(10) NOT NULL
);

INSERT INTO orders(employee_id, amount, order_status)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.5, 'OPEN'),
('e05', 100.7, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.5, 'CANCELLED');

SELECT *,
CASE 
		WHEN order_status = 'OPEN' THEN 'Order is in open state'
        WHEN order_status = 'CLOSED' THEN 'Order is closed'
        WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
        ELSE 'Undefined state'
	END AS 'full_order_status'

FROM orders;



