WITH PaymentStats AS (
  SELECT p.customer_id, SUM(p.amount) AS total_payment
  FROM payment p
  GROUP BY p.customer_id
),
RentalStats AS (
  SELECT r.customer_id, COUNT(r.rental_id) AS num_rentals
  FROM rental r
  GROUP BY r.customer_id
)
SELECT
  c1.customer_id AS top_paying_customer_id,
  c1.first_name AS top_paying_first_name,
  c1.last_name AS top_paying_last_name,
  p.total_payment AS top_payment_amount,
  c2.customer_id AS most_renting_customer_id,
  c2.first_name AS most_renting_first_name,
  c2.last_name AS most_renting_last_name,
  r.num_rentals AS most_rented_films
FROM Customer c1
INNER JOIN PaymentStats p ON c1.customer_id = p.customer_id
INNER JOIN Customer c2 ON c1.customer_id = c2.customer_id
INNER JOIN RentalStats r ON c2.customer_id = r.customer_id
WHERE p.total_payment = (SELECT MAX(total_payment) FROM PaymentStats)
   OR r.num_rentals = (SELECT MAX(num_rentals) FROM RentalStats);
