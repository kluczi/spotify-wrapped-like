WITH src AS (
    SELECT
        {{ generate_dim_sk(['artist_name']) }} AS artist_genre_sk,
        {{ generate_dim_sk(['artist_name']) }} AS artist_sk,
        artist_name,
        artist_genres
    FROM 
        {{ref('stg_spotify_tracks')}}
    WHERE   
        artist_genres IS NOT NULL
),

exploded AS (
    SELECT DISTINCT 
        artist_genre_sk,
        artist_sk,
        {{ normalize_str('artist_name') }} AS artist_name,
        {{ normalize_str('g') }} AS genre
    FROM 
        src
    CROSS JOIN 
        unnest(string_to_array(artist_genres, ',')) AS g
    WHERE {{ normalize_str('g') }} <> ''
)

SELECT 
    artist_genre_sk,
    artist_sk,
    {{ generate_dim_sk(['genre']) }} AS genre_sk,
    artist_name,
    genre
FROM exploded