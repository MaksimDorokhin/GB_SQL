USE mydb;

CREATE TABLE Cars
(
id SERIAL PRIMARY KEY,
Name VARCHAR(50),
Cost INT);

INSERT INTO Cars(Name, Cost) 
VALUES
('Audi', 52642),
('Mercedes', 57127),
('Skoda', 9000),
('Volvo', 29000),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 21600);

SELECT * FROM Cars;

-- 1.	Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов.

CREATE VIEW cars_view AS
SELECT * FROM Cars
WHERE Cost < 25000;

SELECT * FROM cars_view;

/*2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов
 (используя оператор ALTER VIEW) 
*/

ALTER VIEW cars_view AS
SELECT * FROM Cars
WHERE Cost < 30000;

SELECT * FROM cars_view;

-- 3 Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”.

CREATE VIEW cars_marks AS
SELECT * FROM Cars
WHERE Name IN ('Skoda', 'Audi');

SELECT * FROM cars_marks;

/*
Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
Есть таблица анализов Analysis:
an_id — ID анализа;
an_name — название анализа;
an_cost — себестоимость анализа;
an_price — розничная цена анализа;
an_group — группа анализов.
Есть таблица групп анализов Groups:
gr_id — ID группы;
gr_name — название группы;
gr_temp — температурный режим хранения.
Есть таблица заказов Orders:
ord_id — ID заказа;
ord_datetime — дата и время заказа;
ord_an — ID анализа.
*/

CREATE TABLE Analysis (
an_id SERIAL PRIMARY KEY,
an_name VARCHAR(50) NOT NULL,
an_cost INT NOT NULL,
an_price INT NOT NULL,
an_group INT NOT NULL
);

INSERT INTO Analysis (an_name, an_cost, an_price, an_group)
VALUES
('Анализ крови', 50, 100, 1),
('Анализ мочи', 30, 70, 1),
('Рентген', 100, 200, 2),
('КТ', 200, 400, 2),
('МРТ', 300, 600, 2),
('ЭКГ', 20, 50, 3),
('Эхокардиограмма', 150, 300, 3),
('УЗИ', 80, 150, 3),
('Аллергопроба', 60, 120, 4);

SELECT * FROM Analysis;

CREATE TABLE Groupe (
gr_id SERIAL PRIMARY KEY,
gr_name VARCHAR(50) NOT NULL,
gr_temp VARCHAR(50) NOT NULL
);

INSERT INTO Groupe (gr_name, gr_temp)
VALUES
('Анализы крови', 'Комнатная температура'),
('Визуальные тесты', 'Холодное хранение'),
('Кардиологические тесты', 'Комнатная температура'),
('Аллергопробы', 'Комнатная температура');

SELECT * FROM Groupe;

CREATE TABLE Orders (
or_id SERIAL PRIMARY KEY,
ord_datetime DATETIME NOT NULL,
ord_an INT NOT NULL
);

INSERT INTO Orders (ord_datetime, ord_an)
VALUES
('2020-02-04 10:30:00', 1),
('2020-02-05 11:45:00', 4),
('2020-02-06 13:00:00', 7),
('2020-02-07 14:15:00', 9),
('2020-02-08 15:30:00', 2),
('2020-02-10 16:45:00', 5),
('2020-02-13 18:00:00', 8),
('2020-03-02 19:15:00', 3),
('2020-03-03 20:30:00', 9),
('2020-04-15 21:45:00', 6);

SELECT * FROM Orders;

SELECT an_name, an_price FROM Analysis
INNER JOIN Orders
ON Analysis.an_id = Orders.ord_an
WHERE ord_datetime BETWEEN '2020-02-05 00:00:00' AND '2020-02-11 23:59:59';

-- Добавьте новый столбец под названием «время до следующей станции». 

CREATE TABLE Trains (
id SERIAL PRIMARY KEY,
train_id INT NOT NULL,
station VARCHAR(20) NOT NULL,
station_time TIME
);

INSERT INTO Trains (train_id, station, station_time)
VALUES
(110, 'San Francisco', '10:00'),
(110, 'Redwood City', '10:54'),
(110, 'Palo Alto', '11:02'),
(110, 'San Jose', '12:35'),
(120, 'San Francisco', '11:00'),
(120, 'Palo Alto', '12:49'),
(120, 'San Jose', '13:30');

SELECT * FROM Trains;

SELECT *,
TIMEDIFF(LEAD(station_time) OVER(PARTITION BY train_id), station_time) AS 'time_to_next_station'
FROM Trains;

