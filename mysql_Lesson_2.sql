1.	Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и 
пароль, который указывался при установке.
______________________________________________________________________________________________
C:\Windows>dir my.cnf
 Том в устройстве C имеет метку OS
 Серийный номер тома: DC22-A01E

 Содержимое папки C:\Windows

17.11.2021  22:27                36 my.cnf
               1 файлов             36 байт
               0 папок  35 632 103 424 байт свободно

C:\Windows>type my.cnf
[client]
user=root
password=******
C:\Windows>mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
...
mysql> \q

#############################################################################################

2.	Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, 
числового id и строкового name.
______________________________________________________________________________________________
mysql> CREATE DATABASE example;
mysql> USE example;
mysql> CREATE TABLE users (id INT PRIMARY KEY AUTO_INCREMENT,  name VARCHAR(255));
mysql> INSERT INTO users (name) VALUES ('User_1');
mysql> SELECT * FROM users;
+----+--------+
| id | name   |
+----+--------+
|  1 | User_1 |
+----+--------+
#############################################################################################

3.	Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в 
новую базу данных sample.
______________________________________________________________________________________________
C:\Users\user>mysqldump example > example_dump.sql
C:\Users\user>mysql
mysql> CREATE DATABASE sample;
C:\Users\user>mysql sample < example_dump.sql
C:\Users\user>mysql
mysql> USE sample;
mysql> SHOW TABLES;
+------------------+
| Tables_in_sample |
+------------------+
| users            |
+------------------+
#############################################################################################

4.	(по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп 
единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп 
содержал только первые 100 строк таблицы.
______________________________________________________________________________________________
C:\Users\user>mysqldump --opt --where="1 limit 100" mysql help_keyword > h_k_dump.sql
mysql> CREATE DATABASE sample_2;
C:\Users\user>mysql sample_2 < h_k_dump.sql
ERROR 3723 (HY000) at line 25: The table 'help_keyword' may not be created in the reserved 
tablespace 'mysql'.
C:\Users\user>mysql sample_2 < h_k_dump.sql /* в файле h_k_dump.sql удалил часть текста,
а именно - "tablespace 'mysql'" и в перенос произошёл :)    */
mysql> USE sample_2;
Database changed
mysql> SHOW TABLES;
+--------------------+
| Tables_in_sample_2 |
+--------------------+
| help_keyword       |
+--------------------+
#############################################################################################


