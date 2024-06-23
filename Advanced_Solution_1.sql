-- Advanced_QUES:1-Calculate the percentage contribution of each pizza category to total revenue.

SELECT 
    pt.category,
    (CONCAT((ROUND(((SUM(od.quantity * p.price)) * 100) / (SELECT 
                            SUM(od.quantity * p.price)
                        FROM
                            pizzas AS p
                                INNER JOIN
                            order_details AS od ON p.pizza_id = od.pizza_id),
                    2)),
            '%')) AS percentage_of_contribution
FROM
    pizzas AS p
        INNER JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
        INNER JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY percentage_of_contribution DESC

