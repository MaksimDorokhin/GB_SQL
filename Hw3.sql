
-- Домашняя работа к семинару 3

USE lesson_1;

-- Создание таблицы 1: Продавцы

DROP TABLE IF EXISTS salespeople;

CREATE TABLE salespeople (
	id SERIAL PRIMARY KEY, 
    snum INT,
	sname VARCHAR(45),
	city VARCHAR(45),
    comm VARCHAR(45)
);

-- Наполнение данными
INSERT INTO salespeople (snum, sname, city, comm)
VALUES
(1001, 'Peel', 'London', '.12'),
(1002, 'Serres', 'San Jose', '.13'),
(1004, 'Motika', 'London', '.11'),
(1007, 'Rifkin', 'Barcelona', '.15'),
(1003, 'Axelrod', 'New York', '.10');

SELECT * FROM salespeople;

-- Создание таблицы 2: Заказчики

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
	id SERIAL PRIMARY KEY, 
    cnum INT,
	cname VARCHAR(45),
	city VARCHAR(45),
    rating INT,
    snum INT
);

-- Наполнение данными
INSERT INTO customers (cnum, cname, city, rating, snum)
VALUES
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'SanJose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'SanJose', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004);

SELECT * FROM customers;

-- Создание таблицы 3: Заказы

DROP TABLE IF EXISTS orders_hw3;

CREATE TABLE orders_hw3 (
	id SERIAL PRIMARY KEY, 
    onum INT,
    amt DECIMAL(10,2),
    odate DATE,
	cnum INT,
    snum INT
);

-- Наполнение данными
INSERT INTO orders_hw3 (onum, amt, odate, cnum, snum)
VALUES
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4723.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001);

SELECT * FROM orders_hw3;

/* 1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm.
 (к первой или второй таблице, используя SELECT) */

SELECT city, sname, snum, comm FROM salespeople;

/* 2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем 
каждого заказчика в городе San Jose. (“заказчики”) */

SELECT rating, cname 
FROM customers 
WHERE city = 'SanJose' ;

/* Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов 
без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”) */

SELECT DISTINCT(snum) FROM orders_hw3;

/* 4. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. 
Используется оператор "LIKE": (“заказчики”)  */

SELECT *
FROM customers
WHERE cname LIKE 'G%';

/* 5. Напишите запрос, который может дать вам все заказы со значениями суммы 
выше чем $1,000. (“Заказы”, “amt”  - сумма) */

SELECT *
FROM orders_hw3
WHERE amt > 1000;

/*6. Напишите запрос который выбрал бы наименьшую сумму заказа.
 (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение) */

SELECT MIN(amt) AS 'мин.заказ' FROM orders_hw3;

/* 7. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков,
у которых рейтинг больше 100 и они находятся не в Риме. */

SELECT * FROM customers
WHERE rating > 100 AND NOT city = 'Rome';

-- Задания по таблице из классной работы.

-- Создание таблицы 

DROP TABLE IF EXISTS staff;

CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	post VARCHAR(100),
	seniority INT, 
	salary INT, 
	age INT
);

-- Наполнение данными
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);

-- 1. Отсортируйте поле “зарплата” в порядке убывания и возрастания

SELECT * FROM staff
ORDER BY salary;

SELECT * FROM staff
ORDER BY salary DESC;

/* 2.	** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей 
заработной платой (возможен подзапрос)  */

SELECT * FROM staff
ORDER BY salary
LIMIT 7, 5;

/* 3. Выполните группировку всех сотрудников по специальности, 
суммарная зарплата которых превышает 100000  */

SELECT post FROM staff
GROUP BY post
HAVING SUM(salary) > 100000;