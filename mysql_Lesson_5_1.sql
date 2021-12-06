/*
Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”


1.
Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
Заполните их текущими датой и временем. */

ALTER TABLE users MODIFY COLUMN  -- при условии что изночально, не был указан данный тип 
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE users MODIFY COLUMN
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
 
UPDATE users -- код ля заполнения текущей датой и временем
SET created_at = DEFAULT;
---------------------------------------------------------------------------------------------------------------------------------------------
/*
2. Таблица users была неудачно спроектирована. Записи created_at и updated_at 
были заданы типом VARCHAR и в них долгое время помещались значения 
в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, 
сохранив введеные ранее значения. */


CREATE TABLE users_2 (
	name varchar(20),
    created_at varchar(20)
);

INSERT INTO users_2 (name, created_at)
	VALUES ( 'Ivan', '20.10.2017 8:10');
	
SELECT * FROM users_2;
/*
name|created_at     |
----+---------------+
Ivan|20.10.2017 8:10| */

UPDATE users_2  -- код преобразования поля к типу DATETIME
	SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'); 
	
SELECT * FROM users_2;
/*
name|created_at         |
----+-------------------+
Ivan|2017-10-20 08:10:00| */

---------------------------------------------------------------------------------------------------------------------------------------------	

/*
3. В таблице складских запасов storehouses_products в поле value могут встречаться 
самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. 
Необходимо отсортировать записи таким образом, чтобы они выводились в порядке 
увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей. */


DROP TABLE IF EXISTS storehouses_products;

CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  product_id varchar(120),
  value INT UNSIGNED
 );

INSERT storehouses_products (product_id, value)
VALUES 
('товар_1', 4), ('товар_2', 34), ('товар_3', 3),
('товар_4', 13), ('товар_5', 0), ('товар_6', 1),
('товар_7', 4), ('товар_8', 0), ('товар_9', 3),
('товар_7', 4), ('товар_8', 0), ('товар_9', 3);

SELECT product_id, value -- код вывода отсортированового списка
FROM storehouses_products
ORDER BY value = 0 ASC, value ASC;
/*
product_id|value|
----------+-----+
товар_6   |    1|
товар_3   |    3|
товар_9   |    3|
товар_1   |    4|
товар_7   |    4|
товар_4   |   13|
товар_2   |   34|
товар_5   |    0|
товар_8   |    0| */

---------------------------------------------------------------------------------------------------------------------------------------------
/*4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся 
в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august') */

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');
  
SELECT *FROM users -- знаю что это не что в итоге должно получитсья.
WHERE MONTH(birthday_at) = 5 OR MONTH(birthday_at) = 8;
---------------------------------------------------------------------------------------------------------------------------------------------
/*
5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, 
заданном в списке IN. */

DROP TABLE IF EXISTS catalogs;

CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');
  
SELECT * FROM catalogs -- код вывода отсортированового списка
WHERE id IN (5, 1, 2)
ORDER BY FIELD(ID,2,1,5);
/*
id|name              
--+------------------
 2|Материнские платы 
 1|Процессоры        
 5|Оперативная память  */
