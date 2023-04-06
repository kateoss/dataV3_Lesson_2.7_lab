USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT c.name, COUNT(fc.film_id) as "num_films"
FROM category AS c
JOIN film_category as fc
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY c.name; 

-- 2. Display the total amount rung up by each staff member in August of 2005.

SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount) AS "earnings"
FROM staff AS s
JOIN payment AS p
ON s.staff_id = p.staff_id
WHERE DATE(p.payment_date) BETWEEN "2005-08-01" AND "2005-08-31"
GROUP BY s.staff_id;

-- 3. Which actor has appeared in the most films?

SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS num_films
FROM actor AS a
JOIN film_actor AS fa
ON a.actor_id = fa.actor_id
GROUP BY a.first_name,a.last_name
ORDER BY num_films DESC
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)

SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS "num_rentals"
FROM customer AS c
LEFT JOIN rental AS r -- INNER JOIN will also work
ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY num_rentals DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, a.address
FROM staff AS s
LEFT JOIN address AS a
ON s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.

SELECT f.title, COUNT(fa.actor_id) AS "num_actors"
FROM film AS f
JOIN film_actor AS fa
ON f.film_id = fa.film_id
GROUP BY f.title
ORDER BY f.title;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT c.last_name, c.first_name, SUM(p.amount) AS total_paid
FROM customer AS c
JOIN payment as p
ON c.customer_id = p.customer_id
GROUP BY c.last_name, c.first_name
ORDER BY c.last_name, c.first_name;

-- 8. List number of films per category.
-- same question as the 1st one

SELECT c.name, COUNT(fc.film_id) as "num_films"
FROM category AS c
JOIN film_category as fc
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY c.name; 