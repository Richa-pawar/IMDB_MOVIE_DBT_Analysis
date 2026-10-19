
{{ config(materialized='table') }}

with split_genres as (

    select
        trim(value::varchar) as genre_name
    from {{ ref('dim_movies') }},
         lateral flatten(
             input => split(genre, ',')
         )
    where genre is not null

)

select distinct
    genre_name
from split_genres
where genre_name is not null
  and genre_name != ''
