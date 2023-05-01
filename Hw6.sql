USE mydb;

/*
1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DELIMITER $$
CREATE FUNCTION sec_to_time_format(n INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE seconds INT DEFAULT 0;
    DECLARE result VARCHAR(50) DEFAULT '';
    
    IF n >= 0 THEN
		SET days = FLOOR (n / 86400);
		SET seconds = n - (days * 86400);
		SET hours = FLOOR (seconds / 3600);
		SET seconds = seconds - (hours * 3600);
		SET minutes = FLOOR (seconds / 60);
		SET seconds = seconds - (minutes * 60);
		SET result = CONCAT (days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
    ELSE
		SET result = 'Введено отрицательное число!';
	END IF;
    RETURN result;
END $$
DELIMITER ;

SELECT sec_to_time_format(123456);

/*
2.	Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/

DELIMITER $$
CREATE PROCEDURE even_numbers()
BEGIN
	DECLARE n INT DEFAULT 2;
    DECLARE res VARCHAR(50) DEFAULT '';
    
    REPEAT
		SET res = CONCAT(res, ' ', n);
        SET n = n + 2;
        UNTIL n > 10
	END REPEAT;
    SELECT res;
END $$
DELIMITER ;

CALL even_numbers();