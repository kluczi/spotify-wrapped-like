SELECT
  al.album_sk,
  al.album_id,
  al.album_name,
  al.album_release_date,
  al.album_type,
  al.album_total_tracks,
  AVG(t.track_popularity) AS avg_track_popularity
FROM {{ ref('dim_album') }} al
JOIN {{ ref('dim_track') }} t
  ON t.album_sk = al.album_sk
GROUP BY
  al.album_sk,
  al.album_id,
  al.album_name,
  al.album_release_date,
  al.album_type,
  al.album_total_tracks
HAVING COUNT(t.track_sk) > 0
ORDER BY
  avg_track_popularity DESC,
  al.album_release_date DESC,
  al.album_name
LIMIT 100
