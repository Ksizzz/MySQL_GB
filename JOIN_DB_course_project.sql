-- история обращений пациента
SELECT 
	p.id,
	CONCAT (p.surname, ' ', p.name, ' ', p.patronymic) AS patient_name,
	p.birthday,
	year(CURRENT_DATE)-year(p.birthday) AS age,
	service,
	s_result,
	mkb.code AS mkb_10,
	mkb.name AS diagnosis,
	CONCAT (prs.surname, ' ', SUBSTRING(prs.name, 1, 1), '.', substring(prs.patronymic, 1, 1), '.')
		AS personnel_name,
	price,
	DATE (rs.created_at) AS date_service,
	TIME (rs.created_at) AS time_service
FROM result_service rs
	JOIN referral r ON rs.referral_id = r.id
	JOIN patient p ON r.patient_id = p.id
	JOIN service_catalog sc ON r.service_id = sc.id
	JOIN class_mkb mkb ON diagnosis_id = mkb.id
	JOIN service_price sp ON sp.id = sc.id
	JOIN personnel prs ON rs.personnel_id = prs.id
WHERE p.id = 2;

-- рейтинг медицинских работников
SELECT 
	rs.id,
	CONCAT (prs.surname, ' ', SUBSTRING(prs.name, 1, 1), '.', substring(prs.patronymic, 1, 1), '.')
		AS personnel_name,
	ps.position_st AS staff,
	cs.review AS review,
	cs.grade AS grade,
	DATE (cs.created_at) AS date_comment,
	TIME (cs.created_at) AS time_comment	
FROM result_service rs
	JOIN personnel prs ON rs.personnel_id = prs.id
	JOIN comment_sr cs ON cs.id = rs.id
	JOIN position_staff ps ON prs.id = ps.id
ORDER BY grade DESC;

