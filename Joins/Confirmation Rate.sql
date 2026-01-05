with cte as(
    select user_id, sum(case when action = 'confirmed' then 1 else 0 end) as sumup, count(user_id)
    as total
    from Confirmations
    group by user_id
)
select s.user_id , coalesce(round(c.sumup/c.total,2),0) as confirmation_rate
from cte c
right join Signups s 
on s.user_id  = c.user_id
