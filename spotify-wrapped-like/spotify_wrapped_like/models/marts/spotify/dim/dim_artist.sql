WITH src AS (
    SELECT 
        {{ dbt_utils.generate_surrogate_key(['artist_name']) }} AS artist_sk,
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