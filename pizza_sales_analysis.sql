USE PROJECT;

SELECT COUNT(*) AS Total_values FROM pizza_sales; 


SELECT * FROM pizza_sales;

DESC pizza_sales;


SELECT SUM(total_price) AS Total_revenue FROM pizza_sales;



SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Avg_order_value FROM pizza_sales;


-- total pizza sold 
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;


-- number of order placed
SELECT COUNT(DISTINCT order_id) AS total_order FROM pizza_sales;


-- average pizzas per order
SELECT round(SUM(quantity)/COUNT(DISTINCT order_id),2) AS avg_pizzas_per_order FROM pizza_sales;

# hourly trend for total pizzas sold 

SELECT DISTINCT hour(order_time) AS order_hour ,SUM(quantity) AS Total_pizza_sold FROM pizza_sales
GROUP BY order_hour
ORDER BY order_hour;

# weekly trend for total orders




# percentage of sales by pizza category 

SELECT pizza_category,round((SUM(total_price) * 100 /(SELECT SUM(total_price) FROM pizza_sales)),2) AS PCT FROM pizza_sales
GROUP BY pizza_category
ORDER BY PCT DESC;


# percentage of sales by pizza size
SELECT pizza_size,round((SUM(total_price) * 100 /(SELECT SUM(total_price) FROM pizza_sales)),2) AS PCT FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC;



# total pizza sold by pizza category 
SELECT pizza_category, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_pizzas_sold DESC;


# Top 5 pizza by revanue
SELECT pizza_name, SUM(total_price) AS total_revanue FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revanue DESC 
LIMIT 5;

# bottom 5 pizzas bu revanue
SELECT pizza_name, SUM(total_price) AS total_revanue FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revanue ASC 
LIMIT 5;

















