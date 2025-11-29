with main as (
    select visited_on , sum(amount) as amount
    from Customer
    group by 1
    order by 1
),
cte as (
select visited_on,
row_number() over(order by visited_on) as rn,
sum(amount) over(order by visited_on rows between 6 PRECEDING and CURRENT ROW) as amount,
round(avg(amount) over(order by visited_on rows between 6 PRECEDING and CURRENT ROW),2) as average_amount
from main
)
select visited_on, amount,average_amount
from cte 
where rn >=7
