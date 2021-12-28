--  таблица "комнаты"
INSERT INTO room(`namber_room`)
VALUES 
	('№1'), ('№2'), ('№3'), ('№4'), ('№5'), ('№6'), ('№7'), ('№8'), ('№9'), ('№10'), ('№11'), ('№11-а'), 
	('№12'), ('№13'), ('№14'), ('№15'), ('№16'), ('№17'), ('№18'), ('№19');

-- таблица "каталог услуг"
INSERT INTO service_catalog(`id`, `service`, `category`)
VALUES 
 (1, 'Рентгенография грудного и поясничного отдела позвоночника', 1),
 (2, 'Рентгенография таза', 1),
 (3, 'Рентгенография бедренной кости', 1),
 (4, 'Рентгенография пяточной кости', 1),
 (5, 'Рентгенография стопы в двух проекциях', 1),
 (6, 'Рентгенография черепа в прямой проекции', 1),
 (7, 'Рентгенография локтевого сустава', 1),
 (8, 'Рентгенография лучезапястного сустава', 1),
 (9, 'Рентгенография коленного сустава', 1),
 (10, 'Рентгенография плечевого сустава', 1),
 (11, 'Рентгенография тазобедренного сустава', 1),
 (12, 'Рентгенография голеностопного сустава', 1),
 (13, 'Рентгенография грудино-ключичного сочления', 1),
 (14, 'Рентгенография придаточных пазух носа', 1),
 (15, 'Рентгеноскопия легких', 1),
 (16, 'Рентгенография легких', 1),
 (17, 'Ирригоскопия', 1),
 (18, 'Цистография', 1),
 (19, 'Определение чувствительности микроорганизмов к антимикробным химиотерапевтическим препаратам.', 2),
 (20, 'Определение чувствительности микроорганизмов к антимикробным химиотерапевтическим препаратам с использованием автоматических анализаторов.', 2),
 (21, 'Общий (клинический) анализ крови развернутый', 3),
 (22, 'Общий (клинический) анализ крови', 3),
 (23, 'Общий (клинический) анализ мочи', 3),
 (24, 'Обнаружение кетоновых тел в моче экспресс-методом', 3),
 (25, 'Биохимическое исследование плевральной жидкости', 3),
 (26, 'Исследование кала на скрытую кровь', 3),
 (27, 'Коагулограмма (ориентировочное исследование системы гемостаза)', 3),
 (28, 'Определение активности аспартатаминотрансферазы в крови', 3),
 (29, 'Определение активности аланинаминотрансферазы в крови', 3),
 (30, 'Исследование уровня общего билирубина в крови', 3),
 (31, 'Исследование уровня свободного и связанного билирубина в крови', 3),
 (32, 'Исследование уровня мочевины в крови', 3),
 (33, 'Исследование уровня креатинина в крови', 3),
 (34, 'Исследование уровня глюкозы в крови', 3),
 (35, 'Исследование уровня общего белка в крови', 3),
 (36, 'Исследование общего иммуноглобулина Е в крови', 3),
 (37, 'Прием (осмотр, консультация) врача-терапевта первичный', 4),
 (38, 'Прием (осмотр, консультация) врача-терапевта повторный', 4),
 (39, 'Прием (осмотр, консультация) врача-акушера-гинеколога первичный', 4),
 (40, '4Проведение экспертизы (исследований) состояния здоровья в отношении живых лиц', 4),
 (41, 'Прием (осмотр, консультация) врача-акушера-гинеколога повторный"', 4),
 (42, 'Прием (осмотр, консультация) врача-офтальмолога первичный"', 4),
 (43, 'Прием (осмотр, консультация) врача-офтальмолога повторный"', 4),
 (44,'Прием (осмотр, консультация) врача-уролога первичный', 4),
 (45, 'Прием (осмотр, консультация) врача-уролога повторный', 4),
 (46, 'Прием (осмотр, консультация) врача-пульмонолога первичный', 4),
 (47, 'Прием (осмотр, консультация) врача-пульмонолога повторный', 4),
 (48, 'Прием (осмотр, консультация) врача-рентгенолога первичный', 4),
 (49, 'Исследование неспровоцированных дыхательных объемов и потоков.', 5),
 (50, 'ЭКГ', 5),
 (51, 'Внутривенное введение лекарственных препаратов', 6),
 (52, 'Непрерывное внутривенное введение лекарственных препаратов', 6),
 (53, 'Взятие крови из периферической вены', 6),
 (54, 'Внутримышечное введение лекарственных препаратов', 6);
 
 
--  таблица "категории услуг"

INSERT INTO service_category(`id`, `name_category`)
VALUES 	
	(1, 'Рентгенологическое обследование'),
	(2, 'Бактериологическое обследование'),
	(3, 'Клинисеческое обследоввание'),
	(4, 'Осмотр врача'),
	(5, 'Функциональное обследование'),
	(6, 'Манипуляции');
	
-- таблица "прайс лист услуг"
INSERT INTO service_price(`id`, `price`)
VALUES 
	 (1, 1812), (2, 2622), (3, 2158), (4, 1867), (5, 1882), (6, 3493), (7, 1776), (8, 2585), (9, 4086), (10, 2440), (11, 2234), (12, 3558), (13, 3364),
	(14, 3414), (15, 4456), (16, 1651), (17, 2062), (18, 3577), (19, 3564), (20, 2021), (21, 3318), (22, 3859), (23, 2314), (24, 2836), (25, 3890),
	(26, 2908), (27, 943), (29, 571), (30, 749), (31, 3681), (32, 1866), (33, 4202), (34, 1246), (35, 4642), (36, 2536), (37, 3273), (38, 4568),
	(39, 953), (40, 4171), (41, 3763), (42, 757), (43, 4317), (44, 3056), (45, 4118), (46, 2295), (47, 3270), (48, 1369), (49, 2154), (50, 4893),
	(51, 4361), (52, 1747), (53, 711), (54, 3374);


-- таблица "коды МКБ-10" (ICD_10) - отдельный файл


-- таблица "должности персонала"	
INSERT INTO position_staff(`position_st`)
VALUES 
	('Врач гениколог'),
	('Врач кардиолог'),
	('Врач лаборант'),
	('Врач офтальмолог'),
	('Врач пульмонолог'),
	('Врач рентгинолог'),
	('Врач терапевт'),
	('Врач уролог'),
	('Лаборант'),
	('Медицинская сестра кабинетна'),
	('Медицинская сестра процедурная'),
	('Регистратор');
	
--  таблица "пациенты"
INSERT INTO patient(`surname`, `name`, `patronymic`, `birthday`, `gender`, `address`, `SNILS`, `passport`, `phone`, `email`)
VALUES 
	('Макаров', 'Иван', 'Андреевич', '1960_01_23', 'м', 'адрес 1', '000-000-000 01', '00_00_000001', '7(000)000-000-01', 'email_1@q.com'),
	('Степанов', 'Арём', 'Сергеевич', '1957_04_12', 'м', 'адрес 2', '000-000-000 02', '00_00_000002', '7(000)000-000-02', 'email_2@q.com'),
	('Алиева', 'Жанна', 'Аркадьевна', '1974_04_24', 'м', 'адрес 3', '000-000-000 03', '00_00_000003', '7(000)000-000-03', 'email_3@q.com'),
	('Наримова', 'Ульяна', 'Максимовна', '1985_09_15', 'ж', 'адрес 4', '000-000-000 04', '00_00_000004', '7(000)000-000-04', 'email_4@q.com'),
	('Халилова', 'Алие', 'Рашидовна', '1990_12_01', 'ж', 'адрес 5', '000-000-000 05', '00_00_000005', '7(000)000-000-05', 'email_5@q.com'),
	('Головко', 'Степан', 'Сергеевич', '1984_05_18', 'м', 'адрес 6', '000-000-000 06', '00_00_000006', '7(000)000-000-06', 'email_6@q.com'),
	('Чеп', 'Ирина', 'Михайловна', '1979_03_19', 'ж', 'адрес 7', '000-000-000 07', '00_00_000007', '7(000)000-000-07', 'email_7@q.com'),
	('Курок', 'Виктор', 'Игоревич', '1980_06_14', 'м', 'адрес 8', '000-000-000 08', '00_00_000008', '7(000)000-000-08', 'email_8@q.com'),
	('Заварина', 'Анастасия', 'Харитоновна', '1981_04_30', 'ж', 'адрес 9', '000-000-000 09', '00_00_000009', '7(000)000-000-09', 'email_9@q.com');


-- таблица "персонал"
INSERT INTO personnel(`surname`, `name`, `patronymic`, `birthday`, `gender`, `address`, `SNILS`, `passport`, `phone`, `email`, `position_staff_id`)
VALUES 
	('Заправкин', 'Макар', 'Игоревич', '1990_12_03', 'м', 'Адресс_11', '100-000-000 00', '00_00_000010', '7(000)000-000-11', 'email_11@q.com', 6),
	('Тутурин', 'Илья', 'Леонидович', '1950_11_23', 'м', 'Адресс_12', '200-000-000 00', '00_00_000011', '7(000)000-000-12', 'email_12@q.com', 2),
	('Гаврилова', 'Ангелина', 'Дмитриевна', '1984_11_18', 'ж', 'Адресс_13', '100-000-000 01', '00_00_000012', '7(000)000-000-13', 'email_13@q.com', 1),
	('Икер', 'Изет', 'Оглыбович', '1985_04_15', 'м', 'Адресс_14', '100-000-000 02', '00_00_000013', '7(000)000-000-14', 'email_14@q.com', 5),
	('Аматко', 'Галина', 'Семёновна', '1974_07_24', 'ж', 'Адресс_15', '100-000-000 03', '00_00_000014', '7(000)000-000-15', 'email_15@q.com', 3),
	('Пертушин', 'Семён', 'Данилович', '1979_08_19', 'м', 'Адресс_16', '100-000-000 04', '00_00_000015', '7(000)000-000-16', 'email_16@q.com', 7),
	('Зарипова', 'Ольга', 'Петровна', '1986_07_14', 'ж', 'Адресс_17', '100-000-000 05', '00_00_000016', '7(000)000-000-17', 'email_17@q.com', 8),
	('Пархоменко', 'Вадим', 'Сергеевич', '1971_04_30', 'м', 'Адресс_18', '100-000-000 06', '00_00_000017', '7(000)000-000-18', 'email_18@q.com', 9),
	('Борисова', 'Людмила', 'Степановна', '1954_04_29', 'ж', 'Адресс_19', '100-000-000 07', '00_00_000018', '7(000)000-000-19', 'email_19@q.com', 12),
	('Мальков', 'Виталий', 'Николаевич', '1976_12_30', 'м', 'Адресс_20', '100-000-000 08', '00_00_000019', '7(000)000-000-20', 'email_20@q.com', 11),
	('Персин', 'Олег', 'Петрович', '1957_09_12', 'м', 'Адресс_21', '100-000-000 09', '00_00_000020', '7(000)000-000-21', 'email_21@q.com', 1);

-- таблица "напарвление на услугу"
INSERT INTO referral(`id`, `patient_id`, `service_id`, `room_id`, `date_s`, `time_s`)
VALUES 
	(1, 2, 34, 4, '2021_11_02', '8:40'),
	(2, 2, 21, 4, '2021_11_02', '8:45'),
	(3, 2, 23, 13, '2021_11_02', ''),
	(4, 5, 46, 6, '2021_12_13', '14:20'),
	(5, 5, 49, 6, '2021_12_13', ''),
	(6, 7, 36, 2, '2021_12_14', '16:50'),
	(7, 2, 11, 3, '2021_12_15', '17:50'),
	(8, 1, 7, 1, '2021_12_16', ''),
	(9, 1, 6, 1, '2021_12_16', ''),
	(10, 3, 53, 4, '2021_12_20', '09:00');
	
-- таблица "результат услуги"
INSERT INTO result_service(`id`, `referral_id`, `s_result`, `diagnosis_id`, `personnel_id`)
VALUES
	(1, 1, "'6,5', (ммоль/л)'", 22098, 3),
	(2, 2, "'RBC', '4,5', '10*12/л', 'HGB', '120', 'г/л', 'WBC', '4,0', '10*9/л', 'HCT', '45', '%'", 22004, 3),
	(3, 3, 'вариант нормы', '22004', 3),
	(4, 4, 'Жалобы на приступообразный кашель, преимущественно в вечернее и ночное время…', 9174, 5),
	(5, 5, 'Выраженное нарушение ФВД по обструктивному типу. ДН 1 ст. Положительная проба с бронолитиком ( сальбутамол)', 9174, 5),
	(6, 6, '256 МЕ/мл', NULL, 10),
	(7, 7, 'Кости целые. Всё - Гуд', NULL, 6),
	(8, 8, 'Нарушений структуры костной ткани - нет', '18003', 6),
	(9, 9, 'Нарушений структуры костной ткани - нет', '18003', 6),
	(10, 10, 'выполнено', NULL, 11);
	
-- таблица "отзывы"
INSERT INTO comment_sr(`id`, `patient_id`, `referral_id`, `review`, `grade`)
VALUES 
	(1, 5, 4, 'Врач очень внимательный. Очень быстро и точно поставил диагноз и назначил лечение.', 5),
	(2, 5, 5, 'Очень хорошее оборудование, очень внимательный персонал', 5),
	(3, 2, 1, 'Анализы сдаю только тут.', 5),
	(4, 3, 10, 'Мед сестра при взятии анализ, пробила вену, теперь хожу с синяком.', 1),
	(5, 2, 7, 'супер', 4),
	(6, 2, 7, 'Доктор шутник', 4),
	(7, 7, 6, NULL, 4),
	(8, 1, 9, NULL, 1);


