WITH src AS (
    SELECT
        {{ normalize_str('artist_name') }} AS artist_name,
        artist_genres
    FROM {{ ref('stg_spotify_tracks') }}
    WHERE artist_genres IS NOT NULL
)

SELECT DISTINCT
    {{ normalize_str('artist_name') }} AS artist_name,
    {{ normalize_str('g') }} AS genre
FROM src
CROSS JOIN unnest(string_to_array(artist_genres, ',')) AS g
WHERE {{ normalize_str('g') }} <> ''
