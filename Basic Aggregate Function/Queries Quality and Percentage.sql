with cte as (
    select query_name , result , position , rating , rating/position as q ,
    case when rating < 3 then rating 
    else null
    end as poor_query_percentage
    from Queries

)
select query_name , round(avg(q),2) as quality,
 round((count(poor_query_percentage)/count(*))*100,2)  as poor_query_percentage
from cte
group by 1
