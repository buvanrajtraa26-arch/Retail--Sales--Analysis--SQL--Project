-- Project Title: Retail Sales Analysis
-- Tool Used: MySQL Workbench
-- Description: Analyze sales data to find insights like total sales,
-- top products, customer behavior, and city-wise performance.


-- Create Database
create database retail_sales_analysis_project;
use retail_sales_analysis_project;

-- Create Table
create table sales(order_id int,order_date date,customer_name varchar(30),city varchar(30),product varchar(50),category varchar(50),quantity int,price decimal(10,2));

-- Insert Data
insert into sales values
(1, '2024-01-01', 'Arun', 'Chennai', 'Laptop', 'Electronics', 1, 50000),
(2, '2024-01-02', 'Divya', 'Chennai', 'Mouse', 'Electronics', 2, 500),
(3, '2024-01-03', 'Kiran', 'Bangalore', 'Shoes', 'Fashion', 1, 2000),
(4, '2024-01-04', 'Meena', 'Chennai', 'Dress', 'Fashion', 3, 1500),
(5, '2024-01-05', 'Ravi', 'Hyderabad', 'Mobile', 'Electronics', 1, 20000),
(6, '2024-01-06', 'Anu', 'Bangalore', 'Laptop', 'Electronics', 1, 55000);

-- Data check
select * from sales;


-- BUSINESS PROBLEM STATEMENTS & SQL ANALYSIS

-- Calculate the total number of orders processed in the dataset 
-- to understand the overall transaction volume.
select count(*) as total_orders from sales;

-- Determine the total revenue generated from all sales 
-- by considering both quantity and price of products.
select sum(quantity * price) as total_sales from sales;

-- Analyze the total sales revenue for each product category 
-- to identify which category contributes the most to the business.
select category, sum(quantity * price) as total_sales
from sales
group by category;

-- Evaluate city-wise sales performance to understand 
-- which location generates the highest revenue.
select city, sum(quantity * price) as total_sales
from sales
group by city;

--  Identify the top-selling product based on total quantity sold 
-- to determine the most popular product among customers.
select product, sum(quantity) as total_qty
from sales
group by product
order by total_qty desc limit 1;

--  Find the order with the highest sales value 
-- to analyze high-value transactions.
select * from sales
order by (quantity * price) desc
limit 1;

--  Calculate the average order value to understand 
-- customer purchasing behavior.
select average(quantity * price) as avg_order_value
from sales;

-- Analyze total spending by each customer 
-- to identify high-value customers.
select customer_name, sum(quantity * price) as total_spent
from sales
group by customer_name
order by total_spent desc;

--  Perform monthly sales trend analysis 
-- to observe revenue patterns over time.
select month(order_date) as month,
       sum(quantity * price) as total_sales
from sales
group by month(order_date);

--  Count the number of orders from each city 
-- to measure customer distribution across locations.
select city, count(*) as order_count
from sales
group by city;

-- Calculate average order value 
-- to understand customer spending behavior.
select avg(quantity * price) as avg_order_value from sales;

--  Determine total spending by each customer 
-- to identify high-value customers.
select customer_name, sum(quantity * price) as total_spent
from sales
group by customer_name
order by total_spent desc;

--  Analyze monthly sales trends 
-- to observe revenue patterns over time.
select month(order_date) as month,
       sum(quantity * price) as total_sales
from sales
group by month(order_date);

--  Count number of orders per city 
-- to measure customer activity by location.
select city, count(*) as order_count
from sales
group by city;

-- Identify categories with total sales greater than 30000 
-- to find high-performing segments.
select category, sum(quantity * price) as total_sales
from sales
group by category
having total_sales > 30000;















































