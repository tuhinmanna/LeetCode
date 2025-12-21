with cte as (
select a1.machine_id, a1.process_id, a2.timestamp - a1.timestamp as time
from Activity a1 
inner join Activity a2
on a1.machine_id = a2.machine_id and a1.process_id = a2.process_id
and a2.activity_type = 'end' and a1.activity_type = 'start'
)
select machine_id, round(avg(time),3) as processing_time
from cte 
group by 1
