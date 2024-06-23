-- Basic_Ques:3-Identify the highest-priced pizza.

SELECT 
    pt.name AS highest_price_pizza, p.price
FROM
    pizzas AS p
        INNER JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1

