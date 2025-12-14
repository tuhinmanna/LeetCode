with summarize as (
select s.student_id, s.student_name,sub.subject_name 
from Students s 
cross join Subjects sub
)
select s.student_id, s.student_name,s.subject_name , coalesce(count(e.subject_name),0) as attended_exams
from summarize s 
left join 
Examinations e 
on s.student_id = e.student_id and s.subject_name = e.subject_name
group by 1,2,3
order by 1,3
