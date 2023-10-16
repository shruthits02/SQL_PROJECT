<img align="left" width="50" height="100" src="https://github.com/shruthits02/SQL_PROJECT/assets/147556178/aa2c7c7a-5212-44d4-8d2e-d592760e206f">
<img align="left" width="120" height="70" src="https://github.com/shruthits02/SQL_PROJECT/assets/147556178/a99a963a-f4a7-4a01-872f-0ebf229a19ba">
<h1>Rental Project</h1>
<br>
:page_facing_up:Project Overview:
<br>
<br>
The DVD Rental Management System is a database-driven application that enables a rental store to efficiently manage its DVD inventory and rental operations. This system is designed to keep track of customer information, available DVDs, rentals, returns, and employee roles within the rental store. It simplifies the rental process, streamlines inventory management, and helps employees provide excellent customer service.<br>
<br>
There are 15 tables in the DVD Rental database:<br><br>

:black_circle: actor – stores actors data including first name and last name.<br>
:black_circle: :movie_camera:film – stores film data such as title, release year, length, rating, etc.<br>
:black_circle: film_actor – stores the relationships between films and actors.<br>
:black_circle: category – stores film’s categories data.<br>
:black_circle: film_category- stores the relationships between films and categories.<br>
:black_circle: store – contains the store data including manager staff and address.<br>
:black_circle: inventory – stores inventory data.<br>
:black_circle: rental – stores rental data.<br>
:black_circle: :dollar:payment – stores customer’s payments.<br>
:black_circle: staff – stores staff data.<br>
:black_circle: customer – stores customer data.<br>
:black_circle: address – stores address data for staff and customers.<br>
:black_circle: :city_sunrise:city – stores city names.<br>
:black_circle: country – stores country names.<br>



<h2>DVD Rental ER Diagram</h2>

![dvd-rental-sample-database-diagram](https://github.com/shruthits02/SQL_PROJECT/assets/147556178/8dc0208c-4d42-4867-9780-f8425ad8c694)

# SQL Code Analysis

**1. Select and count(distinct)**

```
SELECT COUNT(DISTINCT CUSTOMER_ID) AS UNIQUE_TOTAL_CUSTOMER
FROM CUSTOMER;
```

This query will count the number of distinct (unique) customer IDs in the "CUSTOMER" table and return the result with the alias "UNIQUE_TOTAL_CUSTOMER." 




