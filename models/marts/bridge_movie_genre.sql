{{ config(materialized='table') }}

select distinct
    movie_id,
    trim(value::varchar) as genre_name

from {{ ref('dim_movies') }},
     lateral flatten(
         input => split(genre, ',')
     )

where genre is not null
  and trim(value::varchar) <> ''