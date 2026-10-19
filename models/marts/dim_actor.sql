
{{ config(materialized='table') }}

with all_actors as (

    select star1 as actor_name
    from {{ ref('dim_movies') }}

    union all

    select star2 as actor_name
    from {{ ref('dim_movies') }}

    union all

    select star3 as actor_name
    from {{ ref('dim_movies') }}

    union all

    select star4 as actor_name
    from {{ ref('dim_movies') }}

)

select distinct
    trim(actor_name) as actor_name
from all_actors
where actor_name is not null
  and trim(actor_name) != ''
