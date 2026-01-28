WITH src AS (
    SELECT
        trim(artist_name) AS artist_name,
        artist_genres
    FROM {{ ref('stg_spotify_tracks') }}
    WHERE artist_genres IS NOT NULL
)

SELECT DISTINCT
    trim(artist_name) as artist_name,
    trim(g) AS genre
FROM src
CROSS JOIN unnest(string_to_array(artist_genres, ',')) AS g
WHERE trim(g) <> ''
