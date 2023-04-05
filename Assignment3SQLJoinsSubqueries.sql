-- 1. list all customers who live in Texas (use JOINs)
select customer.customer_id, customer.first_name, customer.last_name, district
from customer 
full join address 
on customer.address_id = address.address_id 
where district = 'Texas';


-- 2. get all payments above $6.99 with the customer's full name
select customer.customer_id, customer.first_name, customer.last_name, amount
from customer 
full join payment 
on customer.customer_id = payment.customer_id 
where amount > 6.99;


-- 3. show all customers names who have made payments over $175 (use subqueries)
select *
from customer
where customer_id in(
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc
);

-- 4. list all customers that live in Nepal (use the city table)
select customer.customer_id, customer.first_name, customer.last_name, city
from customer
full join address 
on customer.address_id = address.address_id 
full join city 
on address.city_id = city.city_id 
where city = 'Nepal';

select * from city
where city = 'Nepal';


-- 5. which staff member has the most transactions
select staff.staff_id, staff.first_name, staff.last_name, count(rental_id)
from staff
full join rental 
on staff.staff_id = rental.staff_id
group by staff.staff_id 
order by staff.staff_id desc;


-- 6. how many movies of each rating are there
select count(distinct content_rating)
from movie

select * from movie

-- 7. show all customers who made a single payment above $6.99
select customer.customer_id, customer.first_name, customer.last_name, amount
from customer
full join payment 
on customer.customer_id = payment.customer_id 
where amount > 6.99;


-- 8. how many free rentals did our stores give away
select count(amount) 
from payment
where amount = 0

