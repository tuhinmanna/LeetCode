with cte as (
    select person_id, person_name, weight, turn,
    row_number() over(order by turn asc) as rnk,
    sum(weight) over(order by turn asc) as total
    from Queue
)
select person_name from cte
where rnk = (select max(rnk) from cte where total <=1000)
