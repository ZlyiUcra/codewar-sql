SELECT  
	EXTRACT(MONTH FROM p.payment_date) as month,
	COUNT(p.payment_id) as total_count,
	SUM(p.amount) as total_amount,
	COUNT(m.payment_id) as mike_count,
	SUM(m.amount) as mike_amount,
	COUNT(j.payment_id) as jon_count,
	SUM(j.amount) as jon_amount
FROM payment p 
		LEFT JOIN (SELECT * FROM payment WHERE staff_id = 1) m ON (p.payment_id = m.payment_id)
		LEFT JOIN (SELECT * FROM payment WHERE staff_id = 2) j ON (p.payment_id = j.payment_id)
	GROUP BY EXTRACT(MONTH FROM p.payment_date) 
	ORDER BY EXTRACT(MONTH FROM p.payment_date);
