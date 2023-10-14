WITH CustomerRentals AS (
  SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS rental_count
  FROM
    customer c
    JOIN rental r ON c.customer_id = r.customer_id
  GROUP BY
    c.customer_id
)
SELECT
  customer_id,
  first_name,
  last_name,
  rental_count
FROM CustomerRentals
WHERE rental_count = (SELECT MAX(rental_count) FROM CustomerRentals)






