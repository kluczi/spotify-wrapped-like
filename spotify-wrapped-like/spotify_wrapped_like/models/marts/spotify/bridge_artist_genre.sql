SELECT DISTINCT
    artist_sk,
    genre_sk
FROM {{ ref('dim_artist_genre') }}
