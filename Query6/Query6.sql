SELECT 
  MAX(rental_duration) AS max_rental_duration,
  MIN(rental_duration) AS min_rental_duration,
  round(AVG(rental_duration),2) AS avg_rental_duration,
  round(stddev(rental_duration),2) AS stddev_rental_duration
FROM film;