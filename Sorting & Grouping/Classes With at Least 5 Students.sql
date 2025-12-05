select class
from Courses
group by 1
having count(*) >=5
