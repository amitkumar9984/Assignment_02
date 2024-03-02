use mavenmovies;
/* Question 1:
Retrieve the total number of rentals made in the Sakila database.
Hint: Use the COUNT() function. */
-- Solution 1
select count(rental_id) from rental;















/* Question 2:
Find the average rental duration (in days) of movies rented from the Sakila database. */
-- Solution 2
select avg(rental_duration)  from film;












-- String Functions:

-- QUESTION 3:
-- Display the first name and last name of customers in uppercase.
-- Hint: Use the UPPER () function.
-- Solution 3
select upper(first_name), upper(last_name) from customer;












-- QUESTION 4:
-- Extract the month from the rental date and display it alongside the rental ID.
-- Hint: Employ the MONTH() function.
-- Solution 4
select rental_id, monthname(rental_date) from rental;














-- GROUP BY

-- QUESTION 5:
-- Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
-- Hint: Use COUNT () in conjunction with GROUP BY.
-- Solution 5
select customer_id, count(rental_id) from rental
group by customer_id;











-- QUESTION 6:
-- Find the total revenue generated by each store.
-- Hint: Combine SUM() and GROUP BY.
-- Solution 6
select store.store_id , sum(amount) from store inner join staff on store.store_id = staff.store_id inner join payment on staff.staff_id = payment.staff_id
group by store_id;












-- JOINS

-- QUESTION 7
-- Display the title of the movie, customers first name, and last name who rented it.
-- Hint: Use JOIN between the film, inventory, rental, and customer tables.
-- Solution 7
select film.title, customer.first_name, customer.last_name from film inner join inventory on film.film_id = inventory.film_id 
inner join rental on inventory.inventory_id = rental.inventory_id inner join customer on rental.customer_id = customer.customer_id;












-- QUESTION 8:
-- Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
-- Hint: Use JOIN between the film actor, film, and actor tables.

-- SOLUTION 8
select first_name, last_name, title from actor inner join film_actor on actor.actor_id = film_actor.actor_id inner join film on film_actor.film_id = film.film_id 
where film.title = "Gone with the wild"; 















-- GROUP BY:
-- QUESTION 9:
-- Determine the total number of rentals for each category of movies.
-- Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.
-- Solution 9
select category_id , count(rental_id) as Total_Number_Rental from film_category inner join film on film.film_id = film_category.film_id
 inner join rental on rental.rental_id = film_category.category_id group by rental_id;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 -- QUESTION 10:
-- Find the average rental rate of movies in each language.
-- Hint: JOIN film and language tables, then use AVG () and GROUP BY.
select * from film; -- rental_rate, film_id, language_id
select * from language; -- language_id, name
-- Solution 10
select name, avg(rental_rate) from language inner join film on language.language_id = film.language_id
group by name;















-- JOINS
-- QUESTION 11:
-- Retrieve the customer names along with the total amount they've spent on rentals.
-- Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
-- Solution 11 
select concat(first_name," ",last_name) as Name, sum(amount) as TotalAmount from customer inner join payment on payment.customer_id = customer.customer_id
inner join rental on rental.rental_id = payment.rental_id group by customer.customer_id;












-- QuUESTION 12:
-- List the titles of movies rented by each customer in a particular city (e.g., 'London').
-- Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.
-- SOLUTION 12
select film.title ,customer.customer_id, city from film inner join inventory on film.film_id = inventory.film_id
 inner join rental on inventory.inventory_id = rental.inventory_id inner join customer on rental.customer_id = customer.customer_id 
 inner join address on customer.address_id = address.address_id inner join city on address.city_id = city.city_id 
 group by city.city, customer.customer_id, title; 
 
 
 
 
 
 
 
 
 
 
 


-- Advanced Joins and GROUP BY:
-- QUESTION 13
-- Display the top 5 rented movies along with the number of times they've been rented.
-- Hint: JOIN film, inventory, and rental tables, then use cOUNT() and GROUP BY, and limit the results
-- Solution 13
select title, count(rental_id) from film inner join inventory on film.film_id = inventory.film_id inner join rental on inventory.inventory_id = rental.inventory_id
group by title
limit 5;











-- QUESTION 14:
-- Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
-- Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.
-- Solution 14
select c.customer_id, concat(c.first_name,' ', c.last_name) as name, st.store_id 
from customer c inner join rental r 
on r.customer_id = c.customer_id inner join inventory iv on iv.inventory_id = r.customer_id 
inner join store st on st.store_id = iv.store_id
where st.store_id  in (1,2)
group by c.customer_id, st.store_id, name
having count(distinct st.store_id);







