-- Create a view that combines films available in the inventory from two stores
CREATE OR REPLACE VIEW combined_inventory AS
SELECT inv.film_id, f.title, inv.store_id
FROM inventory inv
join film f on inv.film_id=f.film_id
WHERE inv.store_id = 1

UNION

SELECT inv.film_id, f.title, inv.store_id
FROM inventory inv
join film f on inv.film_id=f.film_id
WHERE inv.store_id = 2;

select * from combined_inventory
limit 25