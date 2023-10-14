SELECT language_id,film_id, title, description
FROM film
WHERE (description ILIKE '%car%' OR description ILIKE '%japan%')
AND language_id IN (SELECT language_id FROM language 
					WHERE name = 'English' OR name = 'French' OR name = 'Japanese')
ORDER BY film_id DESC
limit 50