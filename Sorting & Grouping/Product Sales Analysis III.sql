with cte as (
    select sale_id, product_id, year, quantity, price,
    row_number() over(partition by product_id order by year asc) as rn
    from Sales
)
select cte.product_id, cte.year as first_year, sales.quantity, sales.price
from cte 
inner join sales on cte.product_id = sales.product_id and cte.year = sales.year
where rn  =1 

-- row number will keep only random 1 record from table, but to get all info of that year, we do join
