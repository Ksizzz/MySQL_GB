
--  таблица "комнаты"
DROP TABLE IF EXISTS room;

CREATE TABLE room (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
namber_room CHAR(5) NOT NULL
);


--  таблица "должности персонала"
DROP TABLE IF EXISTS position_staff;

CREATE TABLE  position_staff (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
position_st VARCHAR(120) UNIQUE NOT NULL
);

--  таблица "персонал"
DROP TABLE IF EXISTS personnel;

CREATE TABLE  personnel (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
surname VARCHAR(50) NOT NULL,
name VARCHAR(50) NOT NULL,
patronymic VARCHAR(50) NOT NULL,
birthday DATE NOT NULL,
gender ENUM('ж', 'м') NOT NULL,
address VARCHAR(150) NOT NULL,
SNILS CHAR(14) UNIQUE NOT NULL,
passport CHAR(14) NOT NULL,
phone CHAR(16) NOT NULL,
email VARCHAR(150) UNIQUE,
position_staff_id BIGINT UNSIGNED NOT NULL,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE personnel
	ADD CONSTRAINT fk_personnel_stf
	FOREIGN KEY (position_staff_id) REFERENCES position_staff(id),
	INDEX position_staff_idx (position_staff_id);


--  таблица "пациенты"
DROP TABLE IF EXISTS patient;

CREATE TABLE  patient (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
surname VARCHAR(50) NOT NULL,
name VARCHAR(50) NOT NULL,
patronymic VARCHAR(50) NOT NULL,
birthday DATE NOT NULL,
gender ENUM('ж', 'м') NOT NULL,
address VARCHAR(150) NOT NULL,
SNILS CHAR(14) UNIQUE NOT NULL,
passport CHAR(14) NOT NULL,
phone CHAR(16) NOT NULL,
email VARCHAR(150) UNIQUE,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- таблица "коды МКБ-10" 
CREATE TABLE class_mkb (
  id int(11) NOT NULL auto_increment COMMENT 'PK',
  `name` varchar(512) NOT NULL COMMENT 'Наименование',
  `code` varchar(20) NOT NULL COMMENT 'Код',
  parent_id int(11) default NULL COMMENT 'Вышестоящий объект',
  parent_code varchar(20) default NULL COMMENT 'Код вышестоящего объекта',
  node_count smallint(6) NOT NULL default '0' COMMENT 'Количество вложенных в текущую ветку',
  additional_info text COMMENT 'Дополнительные данные',
  PRIMARY KEY  (id),
  KEY parent_id (parent_id),
  KEY parent_code (parent_code)
);

-- таблица "категории услуг"
DROP TABLE IF EXISTS service_category;

CREATE TABLE  service_category (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name_category VARCHAR(500) NOT NULL
);


--  таблица "каталог услуг"
DROP TABLE IF EXISTS service_catalog;

CREATE TABLE service_catalog (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
service VARCHAR(500) NOT NULL UNIQUE,
category BIGINT UNSIGNED NOT NULL
);

ALTER TABLE `service_catalog`
	ADD CONSTRAINT fk_service_category_in_catalog
	FOREIGN KEY (category) REFERENCES service_category(id);
	
--  таблица "прайс услуг"
DROP TABLE IF EXISTS service_price;

CREATE TABLE  service_price (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
price INT NOT NULL
);

ALTER TABLE `service_price`
	ADD CONSTRAINT fk_service_price
	FOREIGN KEY (id) REFERENCES service_catalog(id);
	

-- таблица "напарвление на услугу"
DROP TABLE IF EXISTS referral;

CREATE TABLE referral (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
patient_id BIGINT UNSIGNED NOT NULL,
service_id BIGINT UNSIGNED NOT NULL,
room_id BIGINT UNSIGNED,
date_s DATE,
time_s CHAR(6),
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE `referral`
	ADD CONSTRAINT fk_referral_1
	FOREIGN KEY (patient_id) REFERENCES patient(id);
ALTER TABLE `referral`
	ADD CONSTRAINT fk_referral_2
	FOREIGN KEY (service_id) REFERENCES service_catalog(id);
ALTER TABLE `referral`
	ADD CONSTRAINT fk_referral_3
	FOREIGN KEY (room_id) REFERENCES room(id);


-- таблица "результаты услуги"
DROP TABLE IF EXISTS result_service;

CREATE TABLE result_service (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
referral_id BIGINT UNSIGNED NOT NULL,
s_result VARCHAR(3000) NOT NULL,
diagnosis_id int(11),
personnel_id BIGINT UNSIGNED NOT NULL,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE result_service
	ADD CONSTRAINT fk_result_service_prsnl
	FOREIGN KEY (personnel_id) REFERENCES personnel(id); 
ALTER TABLE result_service
	ADD CONSTRAINT fk_result_service_dgns
	FOREIGN KEY (diagnosis_id) REFERENCES class_mkb(id);
ALTER TABLE result_service
	ADD CONSTRAINT fk_result_service_rfrrl
	FOREIGN KEY (referral_id) REFERENCES referral(id);
ALTER TABLE result_service
	ADD INDEX (personnel_id);


-- таблица "отзывы"
DROP TABLE IF EXISTS comment_sr;

CREATE TABLE comment_sr (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
patient_id BIGINT UNSIGNED NOT NULL,
referral_id BIGINT UNSIGNED NOT NULL,
review VARCHAR(1000),
grade ENUM('1', '2', '3', '4', '5') NOT NULL,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE comment_sr
	ADD CONSTRAINT fk_comment_ptnt
	FOREIGN KEY (patient_id) REFERENCES patient(id);
ALTER TABLE comment_sr
	ADD CONSTRAINT fk_comment_rfrrl
	FOREIGN KEY (referral_id) REFERENCES referral(id);
ALTER TABLE comment_sr
	ADD	INDEX (grade);
	


