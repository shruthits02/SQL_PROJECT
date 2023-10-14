SELECT r.customer_id,
r.rental_id,r.rental_date,r.return_date,concat(c.first_name,' ',c.last_name)as Name,c.email
 FROM
	rental r
	join customer c on c.customer_id=r.customer_id
	
WHERE
	r.return_date BETWEEN '2005-01-01' AND '2005-12-31'
	order by r.customer_id asc,rental_id desc	
	