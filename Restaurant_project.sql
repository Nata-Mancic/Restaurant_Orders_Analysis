-- creating table menu_items in restaurant_project database

CREATE TABLE menu_items (
	menu_item_id SMALLINT PRIMARY KEY,
	item_name VARCHAR(50),
	category VARCHAR(50),
	price NUMERIC(5,2)
)

-- exploring the table menu_items after importing .csv file
SELECT * FROM menu_items

-- total number of menu items
SELECT COUNT(*) FROM menu_items 

-- What are the least and most expensive items on the menu?
SELECT *
FROM menu_items
WHERE price = (SELECT MAX(price) FROM menu_items)

SELECT *
FROM menu_items
WHERE price = (SELECT MIN(price) FROM menu_items)

-- How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?
SELECT COUNT(*) 
FROM menu_items 
WHERE category = 'Italian'

SELECT *
FROM menu_items 
WHERE category = 'Italian'
	AND price = (SELECT MAX(price) FROM menu_items WHERE category = 'Italian')

SELECT *
FROM menu_items 
WHERE category = 'Italian'
	AND price = (SELECT MIN(price) FROM menu_items WHERE category = 'Italian')

-- How many dishes are in each category? What is the average dish price within each category?
SELECT 
	category,
	COUNT(*) AS num_dishes,
	ROUND(AVG(price),2) AS average_price
FROM menu_items
GROUP BY category



-- creating table order_details in restaurant_project database
CREATE TABLE order_details (
	order_details_id SMALLINT PRIMARY KEY,
	order_id SMALLINT NOT NULL,
	order_date DATE,
	order_time TIME,
	item_id SMALLINT
)

-- exploring the table order_details after importing .csv file
SELECT * FROM order_details

-- What is the date range of the table?
SELECT 
	MIN(order_date) AS range_start,
	MAX(order_date) AS range_end
FROM order_details

-- How many orders were made within this date range? How many items were ordered within this date range?
SELECT 
	COUNT(DISTINCT order_id) AS num_orders
FROM order_details

SELECT 
	COUNT(*) AS total_items
FROM order_details

-- Which orders had the most number of items?
SELECT 
	order_id, 
	COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC

-- How many orders had more than 12 items?
SELECT COUNT(*)
FROM (SELECT order_id, COUNT(item_id) AS num_items
	FROM order_details
	GROUP BY order_id
	HAVING COUNT(item_id) > 12
	ORDER BY num_items) AS num_orders


-- Analyzing customer behavior by combining the orders and items tables
CREATE VIEW restarant_data AS
	SELECT * FROM order_details AS orders
	LEFT OUTER JOIN menu_items AS items
	ON orders.item_id = items.menu_item_id

ALTER VIEW restarant_data RENAME TO restaurant_data

SELECT * FROM restaurant_data

--What were the least and most ordered items? What categories were they in?
SELECT item_name, category, COUNT(item_id) AS num_items
FROM restaurant_data
GROUP BY item_name, category
ORDER BY num_items DESC

SELECT item_name, category, COUNT(item_id) AS num_items
FROM restaurant_data
GROUP BY item_name, category
ORDER BY num_items


-- What were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_price
FROM restaurant_data
WHERE price IS NOT NULL
GROUP BY order_id
ORDER BY total_price DESC
LIMIT 5

-- View the details of the highest spend order. Which specific items were purchased?
SELECT item_name, category, price, order_date
FROM restaurant_data
WHERE order_id = 440
ORDER BY category

SELECT category, COUNT(item_name) AS num_items
FROM restaurant_data
WHERE order_id = 440
GROUP BY category


-- View the details of the top 5 highest spend orders

SELECT order_id, item_name, category, price, order_date
FROM restaurant_data
WHERE order_id IN (440, 2075, 1957, 330, 2675)
ORDER BY order_id, category

SELECT category, COUNT(item_name) AS num_items
FROM restaurant_data
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY category
ORDER BY category