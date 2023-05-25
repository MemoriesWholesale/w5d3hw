--1. List all customers who live in Texas (use JOINs)
select c.first_name, c.last_name, a.district
from customer c 
join address a 
on c.address_id = a.address_id
where a.district = 'Texas';

--2. List all payments of more than $7.00 with the customer’s first and last name
select c.first_name, c.last_name, p.amount
from customer c
join payment p
on c.customer_id = p.customer_id 
where p.amount > 7;

--3. Show all customer names who have made over $175 in payments (use
--subqueries)
select *
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175);

--4. List all customers that live in Argentina (use the city table)
select c.first_name, c.last_name, a.district, ct.city, co.country
from customer c
join address a 
on c.address_id = a.address_id
join city ct
on a.city_id = ct.city_id 
join country co
on ct.country_id = co.country_id
where co.country = 'Argentina';

--5. Show all the film categories with their count in descending order
select fc.category_id, c.name, count(film_id) as num_movies_in_cat
from film_category fc
join category c 
on fc.category_id = c.category_id 
group by c.name,fc.category_id
order by count(film_id) desc;

--6. What film had the most actors in it (show film info)?
select fa.film_id,f.title,count(actor_id) as num_actors
from film f 
join film_actor fa 
on f.film_id = fa.film_id
group by fa.film_id,f.title
order by count(actor_id) desc
limit 1;

--7. Which actor has been in the least movies?
select fa.actor_id,a.first_name,a.last_name,count(film_id) as num_films
from actor a 
join film_actor fa 
on a.actor_id = fa.actor_id 
group by fa.actor_id,a.first_name,a.last_name 
order by count(film_id) asc 
limit 1;

--8. Which country has the most cities?
select ct.country_id,co.country,count(ct.country_id) as num_cities
from city ct
join country co
on ct.country_id = co.country_id
group by ct.country_id,co.country
order by count(ct.country_id) desc
limit 1;

--9. List the actors who have been in between 20 and 25 films.
select a.actor_id,a.first_name,a.last_name,count(fa.actor_id)
from actor a
join film_actor fa 
on a.actor_id = fa.actor_id
group by a.actor_id,a.first_name,a.last_name
having count(fa.actor_id) between 20 and 25;


