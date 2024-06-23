-- Basic_Ques:2-Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM
    order_details AS od
        INNER JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id



