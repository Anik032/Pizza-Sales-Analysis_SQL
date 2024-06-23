-- Intermidiate_QUES:2-Determine the distribution of orders by hour of the day.

select hour(order_time), count(order_id)as number_of_orders
from orders
group by hour(order_time)
