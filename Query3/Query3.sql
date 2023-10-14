select * from film where description ILike '%car%' and language_id=
(select distinct(language_id) from language where name='English')
order by film_id desc	
