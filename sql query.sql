select 
year(sale_date) as year,
month(sale_date)as month ,
avg(total_sale) as avg_sale,
rank()over(partition by year(sale_date) order by  avg (sale_date)
from  retail_sales
group by year,month;

select *from retail_sales;

select 
customer_id ,
sum(total_sale) as total_sales
from retail_sales
group by  customer_id
order by total_sales desc
limit 5;

select category,
count(distinct(customer_id))
from retail_sales
group by category;
select  hour(sale_time) from retail_sales;
with hourly_sale
as
(select *,
case
when hour(sale_time) <12 then 'Morning'
when hour(sale_time) between 12 and 17 then 'Afternoon'
else
'evening'
end as shift
from retail_sales)
select shift ,
count(*) as total_orders
from hourly_sale
group by shift