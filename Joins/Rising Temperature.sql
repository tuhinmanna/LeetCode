with compact as (
    select id, recordDate, temperature,
    lag(temperature,1) over(order by recordDate) as prev_day_temp,
    lag(recordDate,1) over(order by recordDate) as prev_date
    from Weather
)
select id from compact where temperature > prev_day_temp
and prev_date  = date_sub(recordDate, interval 1 DAY)
