WITH src AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['artist_name']) }} AS artist_genre_sk,
        artist_name,
        artist_genres
    FROM 
        {{ref('stg_spotify_tracks')}}
    WHERE   
        artist_genres IS NOT NULL
)

SELECT DISTINCT 
    artist_genre_sk,
    trim(artist_name) as artist_name,
    trim(g) AS genre
FROM 
    src
CROSS JOIN 
    unnest(string_to_array(artist_genres, ',')) AS g --split multiple values from string into rows