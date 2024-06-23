-- Intermidiate_QUES:4-Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    round(avg(daily_total))
FROM
    (SELECT 
        o.order_date, SUM(od.quantity) AS daily_total
    FROM
        order_details AS od
    INNER JOIN orders AS o ON od.order_id = o.order_id
    GROUP BY o.order_date) AS avg_daily_order