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

**Output**
```
"unique_total_customer"
"599"
```

**2. Case statement and Round**
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

**Output**
```
"payment_id","customer_id","staff_id","rental_id","amount","selling_price","payment_date"
17503,341,2,1520,"7.99","9.03","2007-02-15 22:25:46.996577"
17504,341,1,1778,"1.99","2.19","2007-02-16 17:23:14.996577"
17505,341,1,1849,"7.99","9.03","2007-02-16 22:41:45.996577"
17506,341,2,2829,"2.99","3.29","2007-02-19 19:39:56.996577"
17507,341,2,3130,"7.99","9.03","2007-02-20 17:31:48.996577"
17508,341,1,3382,"5.99","6.77","2007-02-21 12:33:49.996577"
17509,342,2,2190,"5.99","6.77","2007-02-17 23:58:17.996577"
17510,342,1,2914,"5.99","6.77","2007-02-20 02:11:44.996577"
17511,342,1,3081,"2.99","3.29","2007-02-20 13:57:39.996577"
17512,343,2,1547,"4.99","5.49","2007-02-16 00:10:50.996577"
17513,343,1,1564,"6.99","7.90","2007-02-16 01:15:33.996577"
17514,343,2,1879,"0.99","1.09","2007-02-17 01:26:00.996577"
17515,343,2,1922,"0.99","1.09","2007-02-17 04:32:51.996577"
17516,343,2,2461,"6.99","7.90","2007-02-18 18:26:38.996577"
17517,343,1,2980,"8.99","10.16","2007-02-20 07:03:29.996577"
17518,343,1,3407,"0.99","1.09","2007-02-21 14:42:28.996577"
17519,344,1,1341,"3.99","4.39","2007-02-15 10:54:44.996577"
17520,344,2,1475,"4.99","5.49","2007-02-15 19:36:27.996577"
17521,344,1,1731,"0.99","1.09","2007-02-16 14:00:38.996577"
17522,345,2,1210,"0.99","1.09","2007-02-15 01:26:17.996577"
17523,345,1,1457,"4.99","5.49","2007-02-15 18:34:15.996577"
17524,345,2,1550,"0.99","1.09","2007-02-16 00:27:01.996577"
17525,345,2,2766,"4.99","5.49","2007-02-19 16:13:41.996577"
17526,346,1,1994,"5.99","6.77","2007-02-17 09:35:32.996577"
17527,346,2,3372,"2.99","3.29","2007-02-21 12:02:45.996577"
17528,346,1,3421,"2.99","3.29","2007-02-21 15:51:24.996577"
17529,347,2,1711,"8.99","10.16","2007-02-16 12:40:18.996577"
17530,347,2,2274,"0.99","1.09","2007-02-18 04:59:41.996577"
17531,347,1,3026,"4.99","5.49","2007-02-20 10:16:26.996577"
17532,347,1,3092,"8.99","10.16","2007-02-20 14:33:08.996577"
17533,347,1,3326,"7.99","9.03","2007-02-21 07:33:16.996577"
17534,348,1,1654,"2.99","3.29","2007-02-16 08:11:14.996577"
17535,348,1,2041,"8.99","10.16","2007-02-17 12:47:26.996577"
17536,348,2,2499,"0.99","1.09","2007-02-18 21:30:02.996577"
17537,349,1,1197,"2.99","3.29","2007-02-15 00:11:12.996577"
17538,349,1,1523,"0.99","1.09","2007-02-15 22:47:06.996577"
17539,349,2,2987,"6.99","7.90","2007-02-20 07:24:16.996577"
17540,349,1,3067,"8.99","10.16","2007-02-20 12:27:47.996577"
17541,350,2,2011,"3.99","4.39","2007-02-17 10:24:35.996577"
17542,350,1,2619,"0.99","1.09","2007-02-19 06:31:38.996577"
17543,350,1,3079,"2.99","3.29","2007-02-20 13:42:06.996577"
17544,350,2,3206,"0.99","1.09","2007-02-20 23:08:05.996577"
17545,351,2,1792,"5.99","6.77","2007-02-16 18:33:16.996577"
17546,351,1,1869,"0.99","1.09","2007-02-17 00:36:26.996577"
17547,351,1,2759,"2.99","3.29","2007-02-19 15:38:50.996577"
17548,352,1,1498,"0.99","1.09","2007-02-15 20:26:26.996577"
17549,352,1,1649,"4.99","5.49","2007-02-16 07:48:59.996577"
17550,352,1,1678,"4.99","5.49","2007-02-16 09:36:54.996577"
17551,352,1,1780,"4.99","5.49","2007-02-16 17:40:11.996577"
17552,352,2,3331,"4.99","5.49","2007-02-21 08:06:19.996577"
```

**3.Wild characters used in Like '%' and '_'**
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

**4.Between and inner join**
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

**5.Sum, group by and having clause**
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

**6.Maximum, minmimum, average, and standard deviation**
```
SELECT 
  MAX(rental_duration) AS max_rental_duration,
  MIN(rental_duration) AS min_rental_duration,
  round(AVG(rental_duration),2) AS avg_rental_duration,
  round(stddev(rental_duration),2) AS stddev_rental_duration
FROM film;
```
This SQL query calculates various statistical measures for the "rental_duration" column in the "film" table, including the maximum, minimum, average, and standard deviation.

**7.Subquery and Dense_rank**
```
SELECT
    f.film_id,
    f.title AS film_title,
    f.rental_duration,
    (
        SELECT DENSE_RANK() OVER (ORDER BY rental_duration DESC)
        FROM film AS subfilm
        WHERE subfilm.film_id = f.film_id
    ) AS rental_duration_rank
FROM film f
limit 50
```
The SQL query you provided appears to be correct for ranking films by rental duration using DENSE_RANK and a correlated subquery. This query will produce a list of films along with their rental duration and the corresponding rank of the films based on rental duration in descending order.

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
This SQL query first creates a Common Table Expression (CTE) called "CustomerRentals" to find the customer with the maximum number of rentals and then selects that customer.

**9.Left join and concat**
```
SELECT f.title as movie_name, c.name, CONCAT(a.first_name, ' ', a.last_name) as actor_name
FROM film_actor fa
LEFT JOIN actor a ON fa.actor_id = a.actor_id
JOIN film f ON f.film_id = fa.film_id
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON c.category_id = fc.category_id
WHERE c.name = 'Comedy' AND CONCAT(a.first_name, ' ', a.last_name) = 'Jennifer Davis';
```
This SQL query retrieves a list of comedy films featuring the actor "Jennifer Davis" by joining the "film_actor," "actor," "film," "film_category," and "category" tables. 

**10. Cte's**
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
This SQL query calculates the top-paying customer and the customer with the most rentals and then combines the results into a single query.

