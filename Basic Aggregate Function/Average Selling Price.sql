with cte as (
    select p.product_id, start_date, end_date, price, units, units* price as total
    from prices p left join unitssold u 
    on p.product_id = u.product_id
    and purchase_date between start_date and end_date
)
select product_id, coalesce(round(sum(total)/sum(units),2),0) as average_price
from cte 
group by 1
