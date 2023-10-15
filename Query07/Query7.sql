SELECT country.country, COUNT(city.city) AS city_count
FROM city
JOIN country ON city.country_id = country.country_id
GROUP BY country.country
ORDER BY city_count DESC
LIMIT 5