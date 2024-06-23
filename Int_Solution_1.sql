-- Intermediate_Ques:1-- Join the necessary tables to find the total quantity of each pizza category ordered.
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