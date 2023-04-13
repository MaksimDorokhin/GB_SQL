-- 1 1. Создайте таблицу с мобильными телефонами (mobile_phones), используя графический интерфейс. 
-- Заполните БД данными.

SELECT * FROM lesson_1.Hw1;

-- 2 Выведите название, производителя и цену для товаров, количество которых превышает 2

SELECT product_name, manufacturer, price FROM lesson_1.Hw1
WHERE product_count > 2;

-- 3 Выведите весь ассортимент товаров марки “Samsung”

SELECT * FROM lesson_1.Hw1
WHERE manufacturer = 'Samsung';

-- 4. (по желанию)* С помощью регулярных выражений найти:
	-- 4.1. Товары, в которых есть упоминание "Iphone"

SELECT * FROM lesson_1.Hw1
WHERE product_name  LIKE 'iPhone %';

-- 4.2. Товары, в которых есть упоминание "Samsung"

SELECT * FROM lesson_1.Hw1
WHERE manufacturer  = 'Samsung';

-- 4.3.  Товары, в которых есть ЦИФРЫ

SELECT * FROM lesson_1.Hw1
WHERE product_name  REGEXP '[0-9]';

-- 4.4.  Товары, в которых есть ЦИФРА "8"  

SELECT * FROM lesson_1.Hw1
WHERE product_name  LIKE '%8%';
