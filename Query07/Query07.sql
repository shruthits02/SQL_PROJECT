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
