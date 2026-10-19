select *
from {{ ref('int_imdb_movies_cleaned') }}
where released_year is not null
  and (
      released_year < 1888
      or released_year > extract(year from current_date())
  )