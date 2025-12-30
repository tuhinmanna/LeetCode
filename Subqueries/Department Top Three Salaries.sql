with cte as (
    select  d.name as Department, e.name as Employee, e.salary as Salary ,
    dense_rank() over(partition by e.departmentId order by salary desc) as rnk
    from Employee e 
    inner join Department d on e.departmentID = d.id

)
select Department, Employee, Salary 
from cte
where rnk in (1,2,3)
