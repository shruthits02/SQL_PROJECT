SELECT
	customer_id,
	SUM (amount) as Total
FROM
	payment
GROUP BY
	customer_id
HAVING
	SUM (amount) > 150