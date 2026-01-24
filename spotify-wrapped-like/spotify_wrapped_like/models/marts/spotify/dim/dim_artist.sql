WITH src AS (
    SELECT 
        artist_name,
        artist_followers,
        artist_popularity
    FROM
        {{ref('stg_spotify_tracks')}}
)

SELECT DISTINCT
    artist_name,
    artist_followers,
    artist_popularity
FROM src