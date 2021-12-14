/* Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”. */

/* 
1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
который больше всех общался с выбранным пользователем (написал ему сообщений).  */

SELECT CONCAT((SELECT firstname FROM users	WHERE id =  to_user_id), ' ', (SELECT lastname FROM users	WHERE id =  to_user_id)) AS to_user,
	CONCAT(users.firstname, ' ', users.lastname) AS from_user_id,
	COUNT(from_user_id) AS total_messeges
FROM messages
	JOIN users ON users.id = messages.from_user_id
WHERE to_user_id = 1 
GROUP BY from_user_id
ORDER BY total_messeges DESC LIMIT 1;
/*
to_user           |from_user_id|total_messeges|
------------------+------------+--------------+
Guadalupe Nitzsche|Elmira Bayer|             3| */

---------------------------------------------------------------------------------------------------------------------------------------------

/* 
2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..  */

SELECT	
	COUNT(like_type) AS total
FROM posts_likes
 	JOIN profiles ON posts_likes.post_id = profiles.user_id
WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) <= 10
ORDER BY total;
/*
total|
-----+
    5| */
---------------------------------------------------------------------------------------------------------------------------------------------
/*
3. Определить кто больше поставил лайков (всего): мужчины или женщины.  */
SELECT
	CASE profiles.gender
		WHEN 'f' THEN 'female'
		WHEN 'm' THEN 'male'
		WHEN 'x' THEN 'not defined'
	END AS gender,
	COUNT(like_type) AS total
FROM posts_likes
	JOIN profiles ON profiles.user_id = posts_likes.user_id
WHERE like_type = 1	
GROUP BY gender
HAVING gender != 'x'
ORDER BY total DESC;

/*
gender|total|
------+-----+
female|   16|
male  |    5| */