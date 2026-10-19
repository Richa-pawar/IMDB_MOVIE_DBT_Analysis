
select
    movie_id,
    actor_name
from {{ ref('bridge_movie_actor') }}
group by movie_id, actor_name
having count(*) > 1
