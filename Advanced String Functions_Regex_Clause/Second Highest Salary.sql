with cte as (
select salary, dense_rank() over(order by salary desc) as rnk 
from Employee
)
select ifnull(
    (select salary from cte where rnk = 2 limit 1), 
    null
    ) as SecondHighestSalary 
