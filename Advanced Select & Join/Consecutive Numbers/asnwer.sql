with cte as (
select id,num, 
lag(num,1) over(order by id) as rnk1,
lag(num,2) over(order by id) as rnk2 
from Logs)
select distinct num as ConsecutiveNums from cte where num = rnk1 and num = rnk2
