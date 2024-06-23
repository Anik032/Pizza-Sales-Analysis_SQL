-- Intermidiate_QUES:5-Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pt.name, ROUND(SUM(od.quantity * p.price)) AS total_rev
FROM
    pizzas AS p
        INNER JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
        INNER JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_rev DESC
limit 3