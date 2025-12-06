select user_id, count(*) as followers_count
from Followers
group by 1
order by 1 asc
