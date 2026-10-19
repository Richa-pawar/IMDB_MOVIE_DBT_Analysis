select
    movie_id,
    series_title,
    released_year,
    certificate,
    runtime,
    genre,
    imdb_rating,
    overview,
    meta_score,
    director,
    star1,
    star2,
    star3,
    star4,
    no_of_votes,
    gross

from {{ source('imdb', 'RAW_IMDB_MOVIES') }}