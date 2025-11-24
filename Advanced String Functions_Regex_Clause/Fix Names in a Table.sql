select user_id,
concat(upper(left(name,1)), lower(right(name,(length(name)-1)))) as name
from Users
order by 1

## Easier approach

select user_id, concat(upper(substr(name,1,1)), lower(substr(name,2))) as name  from users
order by user_id
