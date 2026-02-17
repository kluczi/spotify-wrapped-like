WITH src AS (
    SELECT 
        {{ generate_dim_sk(['album_id']) }} AS album_sk,
        album_id,
        album_name,
        album_release_date,
        album_type,
        album_total_tracks
    FROM
        {{ref('stg_spotify_tracks')}}
)

SELECT DISTINCT
    album_sk,
    album_id,
    album_name,
    album_release_date,
    album_type,
    album_total_tracks
FROM 
    src
WHERE
    album_id IS NOT NULL
