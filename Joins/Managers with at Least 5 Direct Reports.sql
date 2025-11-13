select e1.name from
Employee e 
inner join Employee e1 
on e.managerId = e1.id
group by e1.id 
having count(*) >= 5

## if multiple employee will have same name , they will have different id , so it's grouped by id
