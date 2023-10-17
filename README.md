<img align="left" width="50" height="100" src="https://github.com/shruthits02/SQL_PROJECT/assets/147556178/aa2c7c7a-5212-44d4-8d2e-d592760e206f">
<img align="left" width="120" height="70" src="https://github.com/shruthits02/SQL_PROJECT/assets/147556178/a99a963a-f4a7-4a01-872f-0ebf229a19ba">
<h1>Project</h1>
<p align="center">
  <img src="https://github.com/shruthits02/SQL_PROJECT/assets/147556178/ec0bcdfb-a432-4179-8905-cc292a29766c" alt="Image" width="600">
</p>
  
# :page_facing_up:Project Overview:

The DVD Rental Management System is a database-driven application that enables a rental store to efficiently manage its DVD inventory and rental operations. This system is designed to keep track of customer information, available DVDs, rentals, returns, and employee roles within the rental store. It simplifies the rental process, streamlines inventory management, and helps employees provide excellent customer service.<br>


## There are 15 tables in the DVD Rental database:

- actor – stores actors data including first name and last name.<br>
- :movie_camera:film – stores film data such as title, release year, length, rating, etc.<br>
- film_actor – stores the relationships between films and actors.<br>
- category – stores film’s categories data.<br>
- film_category- stores the relationships between films and categories.<br>
- store – contains the store data including manager staff and address.<br>
- inventory – stores inventory data.<br>
- rental – stores rental data.<br>
- :dollar:payment – stores customer’s payments.<br>
- staff – stores staff data.<br>
- customer – stores customer data.<br>
- address – stores address data for staff and customers.<br>
- :city_sunrise:city – stores city names.<br>
- country – stores country names.<br>



<h2>DVD Rental ER Diagram</h2>

![dvd-rental-sample-database-diagram](https://github.com/shruthits02/SQL_PROJECT/assets/147556178/8dc0208c-4d42-4867-9780-f8425ad8c694)

# SQL Code Analysis

**1. Select and count(distinct)**

```
SELECT COUNT(DISTINCT CUSTOMER_ID) AS UNIQUE_TOTAL_CUSTOMER
FROM CUSTOMER;
```

This query will count the number of distinct (unique) customer IDs in the "CUSTOMER" table and return the result with the alias "UNIQUE_TOTAL_CUSTOMER." 

**2. case statement and Round**
```
SELECT
    payment_id,
    customer_id,
    staff_id,
    rental_id,
    amount,
    CASE
        WHEN amount < 5 THEN ROUND(amount + (amount * 10) / 100, 2)
        ELSE ROUND(amount + (amount * 13) / 100, 2)
    END AS selling_price,
    payment_date
FROM payment
LIMIT 50;
```
This query selects the specified columns from the "payment" table. It calculates the "selling_price" using a CASE statement that applies a 10% tax rate if the "amount" is less than 5, and a 13% tax rate if the "amount" is greater than or equal to 5. The "selling_price" is then rounded to two decimal places. Finally, the query limits the result to the first 50 rows using LIMIT 50.

**3.Wild characters Like and '%' and '_'**
```
SELECT
    language_id,
    film_id,
    title,
    description
FROM film
WHERE
    (description ILIKE '%car%' OR description ILIKE '%j_p_n%')
    AND language_id IN (
        SELECT language_id
        FROM language
        WHERE name IN ('English', 'French', 'Japanese')
    )
ORDER BY film_id DESC
LIMIT 50;
```
selects specific columns from the "film" table where the "description" column contains the words 'car' or 'japan' (case-insensitive) and the "language_id" is in the set of IDs for languages with names 'English,' 'French,' or 'Japanese.' The results are then ordered by "film_id" in descending order and limited to the first 50 rows.

**4.**
```
SELECT r.customer_id,
r.rental_id,r.rental_date,r.return_date,concat(c.first_name,' ',c.last_name)as Name,c.email
 FROM
	rental r
	join customer c on c.customer_id=r.customer_id
	
WHERE
	r.return_date BETWEEN '2005-01-01' AND '2005-12-31'
	order by r.customer_id asc,rental_id desc
limit 50
```
The SQL query is used to retrieve rental information for customers who returned their rentals between January 1, 2005, and December 31, 2005. The query also joins the "rental" table with the "customer" table and orders the results by customer ID in ascending order and rental ID in descending order. The "LIMIT 50" clause restricts the result set to the first 50 rows. 

**5.**
```
SELECT
	customer_id,
	SUM (amount) as Total
FROM
	payment
GROUP BY
	customer_id
HAVING
	SUM (amount) > 150
```
This SQL query is used to retrieve the total payment amount for each customer and filter the results to include only customers whose total payment amount is greater than $150.

**6.**
```
SELECT 
  MAX(rental_duration) AS max_rental_duration,
  MIN(rental_duration) AS min_rental_duration,
  round(AVG(rental_duration),2) AS avg_rental_duration,
  round(stddev(rental_duration),2) AS stddev_rental_duration
FROM film;
```
This SQL query calculates various statistical measures for the "rental_duration" column in the "film" table, including the maximum, minimum, average, and standard deviation.

**7.**
```
SELECT country.country, COUNT(city.city) AS city_count
FROM city
JOIN country ON city.country_id = country.country_id
GROUP BY country.country
ORDER BY city_count DESC
LIMIT 5
```
**8.**
```
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
```
**9.**
```
SELECT f.title as movie_name, c.name, CONCAT(a.first_name, ' ', a.last_name) as actor_name
FROM film_actor fa
LEFT JOIN actor a ON fa.actor_id = a.actor_id
JOIN film f ON f.film_id = fa.film_id
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON c.category_id = fc.category_id
WHERE c.name = 'Comedy' AND CONCAT(a.first_name, ' ', a.last_name) = 'Jennifer Davis';
```
**10**
```
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
```


