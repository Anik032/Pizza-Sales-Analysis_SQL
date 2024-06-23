-- Basic_Ques:5-List the top 5 most ordered pizza types along with their quantities.
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
