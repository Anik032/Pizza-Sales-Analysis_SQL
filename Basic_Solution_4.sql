-- Basic_Ques:4-Identify the most common pizza size ordered.

SELECT 
    p.size AS most_common_size, COUNT(p.size) AS number_ordered
FROM
    order_details AS od
        JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY COUNT(p.size) DESC
LIMIT 1
