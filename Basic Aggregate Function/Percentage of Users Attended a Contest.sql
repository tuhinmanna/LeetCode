select contest_id, round(count(distinct user_id)*100/(select count(*) from users) ,2) as percentage
FROM Register
group by contest_id
order by 2 desc,1 asc
