SELECT
  album_sk,
  album_id,
  album_name,
  album_release_date,
  album_type,
  album_total_tracks
FROM {{ ref('dim_album') }}
WHERE album_release_date IS NOT NULL
ORDER BY album_release_date DESC, album_name
LIMIT 50
