-- Advanced_QUES:3-Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select category,name, revenue from
(select category, name, revenue,
rank() over(partition by category order by revenue desc) as rn
from
(select pt.category,pt.name, round(sum(od.quantity*p.price),2)as revenue
FROM
    pizzas AS p
        INNER JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
        INNER JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
group by pt.category, pt.name) as a) as b

where rn<=3
