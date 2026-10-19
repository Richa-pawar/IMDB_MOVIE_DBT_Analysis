select *
from {{ ref('int_imdb_movies_cleaned') }}
where no_of_votes is not null
  and no_of_votes < 0