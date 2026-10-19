
select
    movie_id,
    genre_name
from {{ ref('bridge_movie_genre') }}
group by movie_id, genre_name
having count(*) > 1
