/* Практическое задание теме “Агрегация данных”
1. Подсчитайте средний возраст пользователей в таблице users. */ 
SELECT  name, birthday_at FROM users;
/*
name     |birthday_at|
---------+-----------+
Геннадий |1990-10-05 |
Наталья  |1984-11-12 |
Александр|1985-05-20 |
Сергей   |1988-02-14 |
Иван     |1998-01-12 |
Мария    |1992-08-29 | */

SELECT AVG(2021-SUBSTRING(birthday_at, 1, 4)) AS средний_возраст FROM users;
/*
средний_возраст|
---------------+
           31.5| */


/*
2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
Следует учесть, что необходимы дни недели текущего года, а не года рождения. */

ALTER TABLE users ADD COLUMN Day_of_week CHAR(20); -- добавил столбец  день недели

UPDATE users 
SET Day_of_week = DATE_FORMAT(date_format(birthday_at, '2021-%m-%d'), '%a'); -- записал данные дня недели соответствующий даты текущего рода (2021) 

SELECT Day_of_week, COUNT(*) AS total  -- вывод сгрупированных данных по каждому дню недели
FROM users
GROUP BY Day_of_week;

/*
Day_of_week|total|
-----------+-----+
Tue        |    2|
Fri        |    1|
Thu        |    1|
Sun        |    2|  */

SELECT DATE_FORMAT(date_format(birthday_at, '2021-%m-%d'), '%a')  AS Day_of_week COUNT(*) AS total FROM users;
FROM users
GROUP BY Day_of_week;
/*
3. (по желанию) Подсчитайте произведение чисел в столбце таблицы */
-- не захотел (^_^)

