-- Advanced_QUES:2-Analyze the cumulative revenue generated over time.
select order_date, 
sum(revenue) Over (order by order_date) as commulative_revenue
from
(SELECT 
    o.order_date, round(SUM(od.quantity * p.price),0)as revenue
FROM
    order_details AS od
        INNER JOIN
    orders AS o ON od.order_id = o.order_id
        INNER JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id
    GROUP BY o.order_date
ORDER BY o.order_date) As date_wise_revenue