-- 1. List all customers who live in Texas (use JOINs) --
SELECT first_name, last_name
FROM customer
JOIN address 
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name --
SELECT first_name, last_name, payment.amount
FROM customer
JOIN payment 
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries) --
SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
)
ORDER BY first_name, last_name;


-- 4. List all customers that live in Nepal (use the city table) --
SELECT *
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
where country.country = 'Nepal';

-- 5. Which staff member had the most transactions? --
SELECT staff_id, COUNT(*) as count_amount
FROM payment
GROUP BY staff_id
ORDER BY count_amount DESC;

-- 6. How many movies of each rating are there? -
SELECT rating, COUNT(*) AS movie_rating
FROM film
GROUP BY rating;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries) --
SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(payment_id) = 1
)
ORDER BY first_name, last_name;

-- 8. How many free rentals did our stores give away? --
SELECT amount, COUNT(*) AS free_rental
from payment
WHERE amount = 0;

