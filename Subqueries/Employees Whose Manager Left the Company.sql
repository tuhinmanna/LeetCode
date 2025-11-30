select employee_id
from Employees
where salary < 30000 and
manager_id not in (select e1.employee_id from Employees e1)
order by 1
