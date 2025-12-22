select p.project_id, round(avg(e.experience_years),2) as average_years
from project p inner join Employee e on p.employee_id = e.employee_id
group by 1
