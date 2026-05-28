create database superstore;
use superstore;

show tables;

select * from data;
desc data;

--  Write a query — total sales by region
select region, sum(sales) as total_sales from data group by region;

--  Write a query — top 10 most profitable products
select `product name` as profitable_products, round(sum(profit),2) as total_profit 
from data 
group by `product name`
order by total_profit desc 
limit 10;

--  Write a query — monthly sales trend
select YEAR(STR_TO_DATE(`order date`, '%d-%m-%Y')) AS YearNum, 
MONTH(STR_TO_DATE(`order date`, '%d-%m-%Y')) AS MonthNum,        
round(sum(sales)) as total_sales
from data 
group by yearnum, monthnum
order by yearnum, monthnum; 

--  Write a query — which category has the most orders
select category, count(*) as total_quantity 
from data 
group by category 
order by total_quantity desc;

--  Write a query — bottom 5 states by profit
select state, round(sum(profit),2)  as total_profit
from data 
group by state
order by total_profit asc
limit 5;