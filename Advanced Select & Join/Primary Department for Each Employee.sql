with cnt as (
    select employee_id , count(*) as total
    from Employee
    group by 1 
)
select e.employee_id, e.department_id 
from Employee e
inner join cnt c on e.employee_id  = c.employee_id
where e.primary_flag = 'Y' or 
(e.primary_flag = 'N' and c.total = 1)