WITH src AS (
    SELECT
        artist_name,
        artist_genres
    FROM 
        {{ref('stg_spotify_tracks')}}
    WHERE   
        artist_genres IS NOT NULL
)

SELECT DISTINCT 
    artist_name,
    trim(g) AS genre
FROM 
    src
CROSS JOIN 
    unnest(string_to_array(artist_genres, ',')) AS g --split multiple values from string into rows