{{ config(materialized='table') }}

select
    movie_id,
    imdb_rating,
    meta_score,
    no_of_votes,
    gross,
    runtime_minutes

from {{ ref('dim_movies') }}