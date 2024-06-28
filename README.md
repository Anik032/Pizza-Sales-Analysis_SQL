# Pizza-Sales-Analysis_SQL
Welcome to the Pizza Sales Analysis project! This repository contains a comprehensive SQL-based analysis of pizza sales data. The project is designed to provide insights into sales performance, customer preferences, and operational efficiency using SQL queries.

## Table of Content

* [Project Overview](#project-overview)
* [Data Summary](#data-summary)
* [Data Model](#data-model)
* [Queries and Insights](#queries-and-insights)
* [Recommendations](#recommendations)
  
## Project Overview:
This project involves analyzing pizza sales data from 4 CSV files, answering 13 questions that range from basic to advanced levels. The data is processed and analyzed using SQL to extract meaningful insights and drive data-driven decision-making.

## Data Summary
The dataset contains a total of 4 tables with 48,620 records and 12 fields.

- Order Details

  The table has the order_details_id which is the primary key of the table along with the order_id, pizza_id as the foreign key of the orders and pizzas table and last, we have the quantity column of each type of pizza.

- Orders

  This table includes the order_id which is the primary key, and the date and time of each order.

- Pizza Types

  We have the pizza_type_id as the primary key, along with each pizza's name, category and ingredients.

- Pizzas

  The pizzas table has the pizza_id as the primary key, and the pizza_type_id as the foreign key from the pizza types table, it also includes the size and price of the pizzas.


## Data Model

![Data Model](https://github.com/Anik032/Pizza-Sales-Analysis_SQL/assets/135404517/13192d11-5497-4657-8401-a2f6cb56295d)

## Queries and Insights  

### 1. Retrieve the total number of orders placed.
```
SELECT 
    COUNT(order_id) AS Total_orders
FROM
    orders
```
Total number of orders are **21,350**
### 2. Calculate the total revenue generated from pizza sales.
  ```
SELECT 
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM
    order_details AS od
        INNER JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id
  ```
Total **$817,860.05** revenue generated from pizza sales
  
### 3. Identify the highest-priced pizza.
```
SELECT 
    pt.name AS highest_price_pizza, p.price
FROM
    pizzas AS p
        INNER JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1
```
The Highest Priced Pizza is **The Greek Pizza** priced **$35.95**
### 4. Identify the most common pizza size ordered.
```
SELECT 
    p.size AS most_common_size, COUNT(p.size) AS number_ordered
FROM
    order_details AS od
        JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY COUNT(p.size) DESC
LIMIT 1
```
Most Common Pizza Ordered is **L** Size
### 5. List the top 5 most ordered pizza types along with their quantities.
```
  SELECT 
    pt.name AS most_ordered_pizza,
    SUM(od.quantity) AS ordered_qty
FROM
    pizzas AS p
        JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY SUM(od.quantity) DESC
LIMIT 5
```
![image](https://github.com/Anik032/Pizza-Sales-Analysis_SQL/assets/135404517/44f38e73-68a3-4637-b726-afbe16b7b4a5)

### 6.Join the necessary tables to find the total quantity of each pizza category ordered. 
```
SELECT 
    pt.category AS most_ordered_category,
    SUM(od.quantity) AS ordered_qty
FROM
    pizzas AS p
        JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY SUM(od.quantity) DESC
```

### 7. Determine the distribution of orders by hour of the day.
```
SELECT 
    HOUR(order_time), COUNT(order_id) AS number_of_orders
FROM
    orders
GROUP BY HOUR(order_time)

```
### 8. Join relevant tables to find the category-wise distribution of pizzas.
```
SELECT 
    category, COUNT(pizza_type_id)as number_of_pizza
FROM
    pizza_types
GROUP BY category
```
### 9. Group the orders by date and calculate the average number of pizzas ordered per day.
```
```
### 10. Determine the top 3 most ordered pizza types based on revenue.
```
```
### 11. Calculate the percentage contribution of each pizza category to total revenue.
```
```
### 12. Analyze the cumulative revenue generated over time.
```
```
### 13.Determine the top 3 most ordered pizza types based on revenue for each pizza category.
```
```

## Recommendations
Having conducted a thorough analysis of the data, I've identified some valuable insights that have the potential to enhance the business. I would like to propose the following recommendations to the business owners.

* Store credit or points can be applied as discounts when purchasing pizzas. Additionally, by occasionally multiplying these points on random days, sales may experience an uplift.
* To enhance Sunday revenue, think about reducing working hours to support employee well-being while also driving pizza sales through limited-time B1G1 flash sales.
* Let customers design custom pizzas with up to 5 toppings. The best ones chosen by the top chef can be added to the menu, and the customer who created it can name the pizza, allowing for regular menu updates based on customer choices.
* October has the lowest revenue, likely due to its seasonal nature, with Halloween as a key factor. To leverage this, think about introducing Halloween-themed pizzas for the whole month or the week leading up to the event. If successful, this approach could extend to incorporating themed pizzas for other festivals too.
* At the close of the year, gather feedback from customers to identify areas for improvement in the restaurant.
* Due to the lower demand for XL and XXL-sized pizzas, consider introducing a half-and-half pizza option, allowing customers to enjoy two different pizza varieties on a single pie.

