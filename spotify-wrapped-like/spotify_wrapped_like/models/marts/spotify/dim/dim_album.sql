WITH src AS (
    SELECT 
        album_id,
        album_name,
        album_release_date,
        album_type,
        album_total_tracks
    FROM
        ref({{'stg_spotify_tracks'}})
)

SELECT DISTINCT
    album_id,
    album_name,
    album_release_date,
    album_type,
    album_total_tracks
FROM 
    src
WHERE
    album_id IS NOT NULL
