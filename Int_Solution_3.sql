-- Intermidiate_QUES:3-Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category, COUNT(pizza_type_id)
FROM
    pizza_types
GROUP BY category