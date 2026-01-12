with cte as (
    select player_id, event_date, lead(event_date,1) over(partition by player_id order by event_date asc) as nxt,
    row_number() over(partition by player_id order by event_date asc) as rn
    from Activity
)
select round(count(distinct case when datediff(c.nxt,c.event_date)= 1 and c.rn = 1 then c.player_id end)/ count(distinct a.player_id),2) as fraction
from Activity a inner join cte c on a.player_id = c.player_id
