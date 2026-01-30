WITH src AS (
    SELECT 
        {{ generate_dim_sk(['artist_name']) }} AS artist_sk,
        artist_name,
        artist_followers,
        artist_popularity
    FROM
        {{ref('stg_spotify_tracks')}}
)

SELECT DISTINCT
    artist_sk,
    artist_name,
    artist_followers,
    artist_popularity
FROM src