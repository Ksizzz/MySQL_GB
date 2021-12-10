/* Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”. */

/* 
1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
который больше всех общался с выбранным пользователем (написал ему сообщений).  */

SELECT CONCAT((SELECT firstname FROM users	WHERE id =  to_user_id), ' ', (SELECT lastname FROM users	WHERE id =  to_user_id)) AS best_friend, 
		COUNT(from_user_id) AS total_messeges FROM messages
WHERE to_user_id = 1 
GROUP BY from_user_id
ORDER BY total_messeges DESC LIMIT 1;
---------------------------------------------------------------------------------------------------------------------------------------------

/* 
2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..  */
/*
я размышлял следующим образом. В таблице posts_likes у нас информация о пользователях которые поставили лайк, а получил лайк пост. 
По этому я определил авторов чей возраст соответсвует заданному и подсчилал лайки постов что они разместили.
Так как у лиц  10 лет и младше постов не оказалось ( в моей БД) я изменил возростной критерий до <= 20 лет.*/

-- индексы лиц соответсвующего возраста
SELECT profiles.user_id, birthday FROM profiles
WHERE SUBSTRING(CURDATE(), 1, 4)-SUBSTRING(birthday, 1, 4) <= 20;
/*
user_id|birthday  |
-------+----------+
      6|2006-12-02|
      7|2014-12-27|
      9|2020-02-28|
     11|2002-04-29| */

-- Индексы их постов
SELECT posts.id AS post_id, user_id 
FROM posts
WHERE posts.user_id IN (SELECT profiles.user_id
FROM profiles
WHERE SUBSTRING(CURDATE(), 1, 4)-SUBSTRING(birthday, 1, 4) <= 20);
/*
post_id|user_id|
-------+-------+
     11|      6|
     12|      6|
     17|     11| */

--  таблица с лакам соответствующих постов
SELECT *
	-- COUNT(like_type) AS total
FROM posts_likes
WHERE post_id IN (SELECT posts.id AS post_id FROM posts WHERE posts.user_id IN 
	(SELECT profiles.user_id FROM profiles WHERE SUBSTRING(CURDATE(), 1, 4)-SUBSTRING(birthday, 1, 4) <= 20))
AND like_type = 1; 
/*
post_id|user_id|like_type|
-------+-------+---------+
     11|      1|        1|
     11|      2|        1|
     11|      3|        1|
     11|      6|        1|
     11|      8|        1|
     12|      5|        1|
     17|      5|        1|
     17|      6|        1| /*

*/ 
-- Итоговый вариант
SELECT 
	COUNT(like_type) AS total
FROM posts_likes
WHERE post_id IN (SELECT posts.id AS post_id FROM posts WHERE posts.user_id IN 
	(SELECT profiles.user_id FROM profiles WHERE SUBSTRING(CURDATE(), 1, 4)-SUBSTRING(birthday, 1, 4) <= 20))
AND like_type = 1; 
/*
total|
-----+
    8| */
---------------------------------------------------------------------------------------------------------------------------------------------
/*
3. Определить кто больше поставил лайков (всего): мужчины или женщины.  */
SELECT
	(SELECT gender FROM profiles WHERE profiles.user_id = posts_likes.user_id) AS gender,
	COUNT(like_type) AS total
FROM posts_likes
WHERE like_type = 1
GROUP BY gender
HAVING gender != 'x'
ORDER BY total DESC;