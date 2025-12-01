with changes as (
    select product_id, new_price, change_date,
    row_number() over(partition by product_id order by change_date desc) as rnk
    from Products 
    where change_date <= '2019-08-16'
)
select p.product_id, coalesce(c.new_price,10) as price
from (select distinct product_id from products ) p 
left join changes c
on p.product_id = c.product_id
and c.rnk = 1 
