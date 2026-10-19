{{ config(materialized='table') }}

with movie_actors as (

    select
        movie_id,
        trim(star1) as actor_name
    from {{ ref('dim_movies') }}
    where star1 is not null
      and trim(star1) != ''

    union all

    select
        movie_id,
        trim(star2) as actor_name
    from {{ ref('dim_movies') }}
    where star2 is not null
      and trim(star2) != ''

    union all

    select
        movie_id,
        trim(star3) as actor_name
    from {{ ref('dim_movies') }}
    where star3 is not null
      and trim(star3) != ''

    union all

    select
        movie_id,
        trim(star4) as actor_name
    from {{ ref('dim_movies') }}
    where star4 is not null
      and trim(star4) != ''

)

select distinct
    movie_id,
    actor_name

from movie_actors