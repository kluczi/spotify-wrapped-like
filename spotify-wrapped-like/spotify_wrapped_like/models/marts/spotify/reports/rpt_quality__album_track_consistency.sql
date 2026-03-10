SELECT
  a.album_sk,
  a.album_id,
  a.album_name,
  a.album_release_date,
  a.album_total_tracks,
  COUNT(t.track_sk) AS actual_track_count,
  (COUNT(t.track_sk) = a.album_total_tracks) AS is_consistent
FROM {{ ref('dim_album') }} a
LEFT JOIN {{ ref('dim_track') }} t
  ON t.album_sk = a.album_sk
GROUP BY
  a.album_sk,
  a.album_id,
  a.album_name,
  a.album_release_date,
  a.album_total_tracks
ORDER BY
  a.album_release_date DESC,
  a.album_name
