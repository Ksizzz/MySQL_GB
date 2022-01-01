
-- Практическое задание по теме “CRUD – операции”:

-- 1. Заполнить все таблицы БД vk данными (по 10-20 записей в каждой таблице)

INSERT INTO users (firstname, lastname, phone, email, password_hash)  -- заполним таблицу users
VALUES 
  ("Lester","Dieter",62829189500,"ante.dictum@protonmail.couk","%B5110376593822218=04092046?3"),
  ("Mccullough","Burton",51078265908,"pede@aol.net","%B9270268433164486=27095696553?3"),
  ("Spears","Cooper",64158648539,"at@hotmail.com","%B9826158272115421=40085277?1"),
  ("Pate","Rogan",68507940024,"donec.tempor@protonmail.net","%B7451070725731323=66107755882?1"),
  ("Dunlap","Wing",65767518897,"tempus.risus@icloud.org","%B1011756890835641=03112964286?7"),
  ("Mays","Norman",71553212228,"amet.nulla@yahoo.org","%B7915078813125175=1307143485?4"),
  ("Lott","Hyatt",5597461068,"donec.consectetuer@aol.com","%B1866672955625769=55128086649?9"),
  ("Martinez","Quentin",5465313258,"tempus.risus@hotmail.org","%B7397406790352118=68032712451?9"),
  ("Cotton","Hop",78963581469,"sodales.nisi@google.net","%B8636300651689152=7106780222?8"),
  ("Wilson","Isaiah",52563107618,"vitae@outlook.org","%B6428020265930547=9203832601?8"),
  ("Battle","August",72749459305,"felis.purus@outlook.ca","%B5360804920862458=08074976150?3"),
  ("Fowler","Orson",86827360231,"vitae.erat@icloud.net","%B5744687202389604=27089498?9"),
  ("Vazquez","Josiah",31067087312,"at@aol.edu","%B7636521890281163=3304802961?1"),
  ("Hodge","Wallace",90516532432,"risus@icloud.com","%B2666028614189109=79062022165?6"),
  ("Valencia","Gray",10475445890,"cursus.purus@google.net","%B8458517551252771=70057423943?8"),
  ("Mcdaniel","Hedley",53992288900,"lobortis.class.aptent@aol.org","%B5447901035455235=03102741445?5"),
  ("Bender","Gabriel",46110914968,"orci@hotmail.couk","%B1342512617858679=75118729972?2"),
  ("Rodgers","Avram",99095428064,"lorem.fringilla.ornare@icloud.couk","%B6283056325667745=38029643?9");
  
   /*
   id|firstname |lastname |phone      |email                             |password_hash                   |created_at         |updated_at         |
--+----------+---------+-----------+----------------------------------+--------------------------------+-------------------+-------------------+
 1|Петя      |Петухов  |99999999929|petya@mail.com                    |81dc9bdb52d04dc20036dbd8313ed055|2021-11-25 00:09:32|2021-11-25 00:09:32|
 2|Вася      |Васильков|99999999919|vasya@mail.com                    |81dc9bdb52d04dc20036dbd8313ed055|2021-11-25 00:09:32|2021-11-25 00:09:32|
22|Lester    |Dieter   |62829189500|ante.dictum@protonmail.couk       |%B5110376593822218=04092046?3   |2021-11-27 23:02:11|2021-11-27 23:02:11|
...
38|Bender    |Gabriel  |46110914968|orci@hotmail.couk                 |%B1342512617858679=75118729972?2|2021-11-27 23:02:11|2021-11-27 23:02:11|
39|Rodgers   |Avram    |99095428064|lorem.fringilla.ornare@icloud.couk|%B6283056325667745=38029643?9   |2021-11-27 23:02:11|2021-11-27 23:02:11|
   */
  
INSERT INTO profiles (user_id, gender, birhday, photo_id, city, country)  -- заполним таблицу profiles
VALUES   
  (22,"m","1965-05-19",10,"Wageningen","Spain"),
  (23,"f","2000-03-21",999999,"Shillong","Turkey"),
  (24,"f","1978-02-16",1999998,"Wells","United Kingdom"),
  (25,"m","1998-10-20",2999997,"Belfast","India"),
  (26,"f","1995-02-24",3999996,"Van","Poland"),
  (27,"f","1974-03-14",4999995,"Buguma","Costa Rica"),
  (28,"x","1997-04-01",5999994,"Daejeon","Nigeria"),
  (29,"m","2005-05-30",6999993,"Gumi","Mexico"),
  (30,"f","1975-01-04",7999992,"Sungai Penuh","India"),
  (31,"m","2008-08-07",8999991,"Plauen","Brazil"),
  (32,"x","2009-10-12",9999990,"Cádiz","Poland"),
  (33,"f","2000-05-02",10999989,"Böblingen","Spain"),
  (34,"m","1991-07-10",11999988,"Kungälv","Canada"),
  (35,"f","1987-06-05",12999987,"Karak","Germany"),
  (36,"f","1995-09-01",13999986,"Đà Nẵng","Germany");
  
/*
user_id|gender|birhday   |photo_id|city        |country       |
-------+------+----------+--------+------------+--------------+
      1|m     |1997-12-01|       1|Москва      |Не Россия     |
      2|m     |1988-11-02|       2|Не Москва   |Россия        |
     22|m     |1965-05-19|      10|Wageningen  |Spain         |
...
     35|f     |1987-06-05|12999987|Karak       |Germany       |
     36|f     |1995-09-01|13999986|Đà Nẵng     |Germany       |
*/

INSERT INTO messages (from_user_id, to_user_id, body, is_delievered)  -- заполним таблицу messages
VALUES
  (38,24,"ridiculus mus. Aenean eget magna.",0),
  (30,28,"dolor dolor, tempus non, lacinia",1),
  (38,34,"bibendum. Donec felis orci, adipiscing",1),
  (36,31,"et nunc. Quisque ornare tortor",0),
  (29,39,"commodo auctor velit. Aliquam nisl.",1),
  (37,27,"purus sapien, gravida non, sollicitudin",1),
  (30,38,"Nullam ut nisi a odio",0),
  (35,35,"nisi dictum augue malesuada malesuada.",1),
  (23,27,"lacinia vitae, sodales at, velit.",0),
  (37,34,"tellus sem mollis dui, in",0),
  (22,26,"sit amet risus. Donec egestas.",1),
  (26,38,"sem semper erat, in consectetuer",1),
  (25,26,"aliquet libero. Integer in magna.",1),
  (36,25,"egestas blandit. Nam nulla magna,",1),
  (23,30,"aliquet vel, vulputate eu, odio.",1),
  (38,24,"ridiculus mus. Aenean eget magna.",0),
  (30,28,"dolor dolor, tempus non, lacinia",1);
  
/*
id|from_user_id|to_user_id|body                                   |create_at          |updated_at         |is_delievered|
--+------------+----------+---------------------------------------+-------------------+-------------------+-------------+
 1|           1|         2|Привет!                                |2021-11-25 00:09:32|2021-11-25 00:09:32|            0|
 2|           1|         2|БРО!                                   |2021-11-25 00:09:33|2021-11-25 00:09:33|            0|
 3|           2|         1|Ну здравствуй.                         |2021-11-25 00:09:33|2021-11-25 00:09:33|            0|
...
21|          38|        24|ridiculus mus. Aenean eget magna.      |2021-11-27 23:52:12|2021-11-27 23:52:12|            0|
22|          30|        28|dolor dolor, tempus non, lacinia       |2021-11-27 23:52:12|2021-11-27 23:52:12|            1|
*/


INSERT INTO communities (name, description, admin_id)  -- заполним таблицу communities
VALUES
  ("Ac Tellus Incorporated","egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed",31),
  ("Mauris LLC","turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla",30),
  ("Rutrum Fusce LLC","Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec",26),
  ("Amet Luctus Vulputate Incorporated","elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse",36),
  ("Risus PC","mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque",35),
  ("Vulputate LLC","dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",38),
  ("Justo Limited","risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy",34),
  ("Ridiculus Associates","molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat",27),
  ("Est Company","purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna",33),
  ("Eu Turpis Institute","convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel,",29),
  ("Donec Nibh Quisque LLP","at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa",26),
  ("In Molestie Associates","libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum",30),
  ("Urna Suscipit Industries","Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis",36),
  ("Nam Inc.","Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit,",38),
  ("Nec Urna Corporation","enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci.",33);

/*
id|name                              |description                                                                                                             |admin_id|
--+----------------------------------+------------------------------------------------------------------------------------------------------------------------+--------+
 1|Группа номер раз                  |Я номер раз                                                                                                             |       1|
 2|Ac Tellus Incorporated            |egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed                 |      31|
...
15|Nam Inc.                          |Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit,                       |      38|
16|Nec Urna Corporation              |enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci.                          |      33|
*/
-- далее принцип ясен. БД сгенерированны тут -->(https://generatedata.com/generator)
---------------------------------------------------------------------------------------------------------------------------------------------

--2. Написать скрипт, возвращающий список имён (только firstname) пользователей без повторений в алфавитном порядке
SELECT DISTINCT firstname FROM users ORDER BY firstname;

/*
firstname |
----------+
Battle    |
Bender    |
Cotton    |
Dunlap    |
...
*/
---------------------------------------------------------------------------------------------------------------------------------------------

-- 3. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
-- Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)


ALTER TABLE profiles ADD COLUMN adult BOOL DEFAULT TRUE; -- добавим столбец - adult(is_active) в таблицу profiles
/*
user_id|gender|birhday   |photo_id|city        |country       |adult|
-------+------+----------+--------+------------+--------------+-----+
      1|m     |1997-12-01|       1|Москва      |Не Россия     |    1|
      2|m     |1988-11-02|       2|Не Москва   |Россия        |    1|
...
     30|f     |1975-01-04| 7999992|Sungai Penuh|India         |    1|
     31|m     |2008-08-07| 8999991|Plauen      |Brazil        |    1|
*/

UPDATE profiles 	-- меняем значение true на false в столбце adult если возраст пользователя меньше 18 лет на теркущую дату
SET adult = 0
WHERE birhday  >= '2003-11-28'; -- почему-то условие WHERE  DATEDIFF(YEAR, CURRENT_DATE(), birhday)<18; не сработало
/*
user_id|birhday   |adult|
-------+----------+-----+
     29|2005-05-30|    0|
     31|2008-08-07|    0|
     32|2009-10-12|    0|
*/
---------------------------------------------------------------------------------------------------------------------------------------------

-- 4. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)


SELECT body, create_at FROM messages 	-- проверяем наличе сообщений "из будущего"
WHERE  create_at  > CURRENT_DATE();
/*
body   |create_at          |
-------+-------------------+
Привет!|2022-11-25 00:00:00|
*/
DELETE FROM messages 	-- скрипт для удаления сообщений с датой отправки большей чем текущая дата
WHERE  create_at  > CURRENT_DATE();

SELECT body, create_at FROM messages 	-- контрольная проверка
WHERE  create_at  > CURRENT_DATE();
/*
body|create_at|   
----+---------+

-- запись удалена, всё работает.
*/
---------------------------------------------------------------------------------------------------------------------------------------------


-- 5. Написать название темы курсового проекта (в комментарии)

/*
Я планирую сделать базу данных для медицинского центра.

Пока сделал шаблон блок-схему таблиц и внешних ключей
посотреть можно тут --> ( https://drive.google.com/file/d/1a_OU8KHMsFrPl4dDWxrzflXRNVGJ0qM3/view?usp=sharing )
*/