select *
from {{ ref('int_imdb_movies_cleaned') }}
where runtime_minutes is not null
  and runtime_minutes <= 0