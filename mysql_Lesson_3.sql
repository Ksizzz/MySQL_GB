CREATE DATABASE IF NOT EXISTS vk_3;

USE vk_3;

CREATE TABLE users(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	phone CHAR(11) NOT NULL,
	email VARCHAR(120) UNIQUE,
	password_hash CHAR(65), 
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX (lastname),
	INDEX (phone)
);

INSERT INTO users 
VALUES (DEFAULT, 'Петя', 'Петухов','99999999929', 'petya@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, DEFAULT);

INSERT INTO users (firstname, lastname, email, password_hash, phone) 
 VALUES ('Вася', 'Васильков', 'vasya@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', '99999999919');

CREATE TABLE profiles(
	user_id SERIAL PRIMARY KEY, 
	gender ENUM('f', 'm', 'x') NOT NULL,
	birhday DATE NOT NULL,
	photo_id BIGINT UNSIGNED NOT NULL,
	city VARCHAR(130),
	country VARCHAR(130),
	FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO profiles VALUES (1, 'm', '1997-12-01', 1, 'Москва', 'Не Россия');
INSERT INTO profiles VALUES (2, 'm', '1988-11-02', 2, 'Не Москва', 'Россия');

CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	create_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	is_delievered BOOLEAN DEFAULT FALSE,
	FOREIGN KEY (from_user_id) REFERENCES users (id),
	FOREIGN KEY (to_user_id) REFERENCES users (id)	
);

INSERT INTO messages VALUES (DEFAULT, 1, 2, 'Привет!', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 1, 2, 'БРО!', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 2, 1, 'Ну здравствуй.', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 1, 2, 'Чё, как?', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 2, 1, 'та норм', DEFAULT, DEFAULT, DEFAULT);

CREATE TABLE friend_requests(
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	accepted BOOL DEFAULT FALSE,
	PRIMARY KEY(from_user_id, to_user_id),
	FOREIGN KEY (from_user_id) REFERENCES users (id),
	FOREIGN KEY (to_user_id) REFERENCES users (id)
);

INSERT INTO friend_requests VALUES (1, 2, 1);

CREATE TABLE communities(
	id SERIAL PRIMARY KEY,
	name VARCHAR(145) NOT NULL,
	description VARCHAR(255),
	admin_id BIGINT UNSIGNED NOT NULL,
	INDEX communities_name_idx (name),
	CONSTRAINT fk_communities_admin_id FOREIGN KEY (admin_id) REFERENCES users (id) 
);


INSERT INTO communities VALUES (DEFAULT, 'Группа номер раз', 'Я номер раз', 1);

CREATE TABLE communities_users(
	community_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY(community_id, user_id),
	FOREIGN KEY (community_id) REFERENCES communities (id),
	FOREIGN KEY (user_id) REFERENCES users (id) 
);

INSERT INTO communities_users VALUES (1, 2);

CREATE TABLE media_types(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45) NOT NULL UNIQUE
);

INSERT INTO media_types VALUES (DEFAULT, 'изображение');
INSERT INTO media_types VALUES (DEFAULT, 'музыка');
INSERT INTO media_types VALUES (DEFAULT, 'документ');


CREATE TABLE media(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	media_types_id INT UNSIGNED NOT NULL,
	file_name VARCHAR(255),
	file_size BIGINT UNSIGNED,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users (id),
	FOREIGN KEY (media_types_id) REFERENCES media_types (id),
	INDEX (media_types_id)
);


INSERT INTO media VALUES (DEFAULT, 1, 1, 'im.jpg', 100, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 1, 1, 'im1.png', 78, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 2, 3, 'doc.docx', 1024, DEFAULT);

SELECT * FROM media;


-- Новые таблицы

/*Таблица №1 музыкальные плейлисты пользователей
в таблице будет храниться следующая информация:
* id - первичный ключ
* пользователь - user_id
* музыкальный файл - music_file_id
* название альбома - album_name
* дата и время добавления в плейлист - created_at

user_id и music_file_id будут внешними ключами
а music_file_id - будет индексом 
*/

CREATE TABLE music_playlist_users (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	music_file_id BIGINT UNSIGNED NOT NULL,
	album_name VARCHAR(255),
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users (id),
	FOREIGN KEY (music_file_id) REFERENCES media(id)
);


SELECT * FROM music_playlist_users;

 /*
 id|user_id|music_file_id|album_name|created_at|
 --+-------+-------------+----------+----------+

 */
-- добавим в таблицу media mp3-файлы
INSERT INTO media VALUES (DEFAULT, 2, 2, 'bagrovyy_fantomas_t_1.mp3', 15024, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 2, 2, 'bagrovyy_fantomas_t_2.mp3', 13003, DEFAULT);

SELECT * FROM media;
/*
id|user_id|media_types_id|file_name                |file_size|created_at         |
--+-------+--------------+-------------------------+---------+-------------------+
 1|      1|             1|im.jpg                   |      100|2021-11-23 23:57:39|
 2|      1|             1|im1.png                  |       78|2021-11-23 23:57:39|
 3|      2|             3|doc.docx                 |     1024|2021-11-23 23:57:39|
 4|      2|             2|bagrovyy_fantomas_t_1.mp3|    15024|2021-11-24 00:09:35|
 5|      2|             2|bagrovyy_fantomas_t_2.mp3|    13003|2021-11-24 00:09:42|
 */



-- добавим наши треки в таблицу плейлист
-- Петя добавил трек 'bagrovyy_fantomas_t_1.mp3' в альбом 'Музыка для души'
INSERT INTO music_playlist_users VALUES (DEFAULT, 2, 4, 'Музыка для души', DEFAULT);
-- Вася  добавил трек 'bagrovyy_fantomas_t_2.mp3' в альбом 'Хиты моей юности'
INSERT INTO music_playlist_users VALUES (DEFAULT, 1, 5, 'Хиты моей юности', DEFAULT);

SELECT * FROM music_playlist_users;

/*
id|user_id|music_file_id|album_name      |created_at         |
--+-------+-------------+----------------+-------------------+
 1|      2|            4|Музыка для души |2021-11-24 00:10:05|
 2|      1|            5|Хиты моей юности|2021-11-24 00:10:08|
*/

/*Таблица 2 создадим аналогичную таблицу с фотографиями images_of_album_users
в таблице будет храниться следующая информация:
* id - первичный ключ
* пользователь - user_id
* файл - image_id
* название фотоальбома альбома - image_album_name
* описание альбома - description
* дата и время добавления в плейлист - created_at

user_id и music_file_id будут внешними ключами
а music_file_id - будет индексом 
*/

CREATE TABLE images_of_album_users (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	image_id BIGINT UNSIGNED NOT NULL,
	image_album_name VARCHAR(255),
	description VARCHAR(1000),
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users (id),
	FOREIGN KEY (image_id) REFERENCES media(id)
);
-- Петя заргущенное фото im.jpg  поместил в альбом "Лето 2007" и подписал "Это было очень давно и возможно всё - не правда."

INSERT INTO images_of_album_users VALUES (DEFAULT, 1, 1, "Лето 2007", "Это было очень давно и возможно всё - не правда.", DEFAULT);

SELECT * FROM images_of_album_users;
/*
id|user_id|image_id|image_album_name|description                                      |created_at         |
--+-------+--------+----------------+-------------------------------------------------+-------------------+
 1|      1|       1|Лето 2007       | Это было очень давно и возможно всё - не правда.|2021-11-24 23:24:40|
*/

/*Таблица 2 Создадим таблицу с комментариями под фото comments_photo
в таблице будет храниться следующая информация:
* id -- первичный ключ
* id конкретного фото в альбоме пользователя - image_of_albums_id
* id пользователя который оставил комментарий - commenting_user_id
* комментарий - commentary
* лайк - lk
* дата и время создания - created_at
* Дата и время изменения - updated_at
image_of_albums_id и commenting_user будут внешними ключами
commenting_user_id будет индексом
*/

CREATE TABLE comments_photo (
	id SERIAL PRIMARY KEY,	
	image_of_albums_id BIGINT UNSIGNED NOT NULL,	
	commenting_user_id BIGINT UNSIGNED NOT NULL,	
	commentary VARCHAR(255),	
	lk BOOL DEFAULT FALSE,	
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (commenting_user_id) REFERENCES users (id),
	FOREIGN KEY (image_of_albums_id) REFERENCES media (id),
	INDEX (commenting_user_id)
);

-- Добавим комментакий от Васи к фото Пети и поставим лайк

INSERT INTO comments_photo VALUES (DEFAULT, 1, 2, "Было весело", 1, DEFAULT, DEFAULT);	

SELECT  * FROM comments_photo;

/*
id|image_of_albums_id|commenting_user_id|commentary |lk|created_at         |updated_at         |
--+------------------+------------------+-----------+--+-------------------+-------------------+
 1|                 1|                 2|Было весело| 1|2021-11-25 00:04:30|2021-11-25 00:04:30|
*/