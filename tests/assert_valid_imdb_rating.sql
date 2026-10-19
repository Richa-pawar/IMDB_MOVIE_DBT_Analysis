select *
from {{ ref('int_imdb_movies_cleaned') }}
where imdb_rating is not null
  and (
      imdb_rating < 0
      or imdb_rating > 10
  )