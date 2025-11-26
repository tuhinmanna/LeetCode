(select name as results from Users u 
inner join movierating mr
on u.user_id = mr.user_id 
group by mr.user_id order by count(rating) desc, u.name limit 1)
union all
(select title as results from movies m 
inner join MovieRating mr
on m.movie_id = mr.movie_id
where month(mr.created_at) = 2 and year(mr.created_at) = 2020
group by mr.movie_id 
order by avg(mr.rating) desc,m.title limit 1)
