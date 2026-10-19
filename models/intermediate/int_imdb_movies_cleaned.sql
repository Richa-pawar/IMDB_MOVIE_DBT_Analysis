with source_data as (

    select *
    from {{ ref('stg_imdb_movies') }}

),

cleaned as (

    select

        -- Identifier
        trim(movie_id) as movie_id,

        -- Movie information
        nullif(trim(series_title), '') as series_title,

        -- Numeric conversions
        try_to_number(
            nullif(trim(released_year), '')
        ) as released_year,

        nullif(
            trim(certificate),
            ''
        ) as certificate,

        -- Convert "142 min" → 142
        try_to_number(
            regexp_substr(runtime, '[0-9]+')
        ) as runtime_minutes,

        nullif(
            trim(genre),
            ''
        ) as genre,

        -- IMDB rating
        try_to_decimal(
            nullif(trim(imdb_rating), ''),
            3,
            1
        ) as imdb_rating,

        nullif(
            trim(overview),
            ''
        ) as overview,

        -- Meta score
        try_to_decimal(
            nullif(trim(meta_score), ''),
            5,
            1
        ) as meta_score,

        -- People
        nullif(trim(director), '') as director,

        nullif(trim(star1), '') as star1,

        nullif(trim(star2), '') as star2,

        nullif(trim(star3), '') as star3,

        nullif(trim(star4), '') as star4,

        -- Number of votes
        try_to_number(
            nullif(trim(no_of_votes), '')
        ) as no_of_votes,

        -- Gross revenue
        -- Example:
        -- 2,83,41,469 → 28341469
        try_to_decimal(
            nullif(
                regexp_replace(
                    trim(gross),
                    '[^0-9]',
                    ''
                ),
                ''
            ),
            20,
            2
        ) as gross

    from source_data

)

select *
from cleaned