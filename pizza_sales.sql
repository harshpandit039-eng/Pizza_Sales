select * from pizza;
select pizza_name,quantity,total_price
from pizza;

select * from pizza
where quantity >2;

select * from pizza
where pizza_size = 'L';

select * from pizza
order by total_price desc;

select distinct pizza_category
from pizza;

select sum(total_price) 
from pizza;

select sum(quantity) 
from pizza;

select pizza_category ,sum(total_price) 
from pizza
group by 1;

select count(order_id) 
from pizza;

select avg(total_price)
from pizza;

select * from 
pizza
order by quantity desc
limit 5;

select pizza_size,round(sum(total_price))
from pizza
group by 1;

select pizza_category ,count(*)
from pizza
group by 1;

select pizza_category,sum(total_price)
from pizza
group by 1
having sum(total_price) >5000;

select pizza_name,sum(quantity)
from pizza
group by 1
having sum(quantity)>100;


select pizza_category,sum(total_price)
from pizza
group by pizza_category
order by sum(total_price) desc
limit 3;

select pizza_name,sum(quantity)
from pizza
group by 1
order by sum(quantity) 
limit 1;

select pizza_name,avg(unit_price)
from pizza
group by 1
having avg(unit_price) >20;

select * from pizza
where unit_price >(select avg(unit_price) from pizza);

select pizza_name,sum(total_price)
from pizza
group by 1
order by sum(total_price) desc
limit 1;

select * from pizza
where total_price >(select avg(total_price) from pizza);

select pizza_name
from pizza
group by pizza_name
having max(quantity)<=1;

select pizza_category, sum(total_price)
from pizza
group by 1 
order by sum(total_price) desc;

select pizza_size ,sum(quantity)
from pizza
group by pizza_size
order by 2 desc;

SELECT AVG(order_quantity) AS avg_pizzas_per_order
FROM (
    SELECT order_id, SUM(quantity) AS order_quantity
    FROM pizza
    GROUP BY order_id
) t;

#Which pizza contributes the most to total sales?

select pizza_name,sum(total_price)
from pizza
group by pizza_name
order by sum(total_price) desc
limit 1;

select pizza_name ,sum(total_price)
from pizza
group by pizza_name
order by sum(total_price) desc
limit 5;

#What percentage of total sales comes from each category?

SELECT pizza_category,
       SUM(total_price) AS category_revenue,
       SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza) AS percentage_contribution
FROM pizza
GROUP BY pizza_category
ORDER BY percentage_contribution DESC;


