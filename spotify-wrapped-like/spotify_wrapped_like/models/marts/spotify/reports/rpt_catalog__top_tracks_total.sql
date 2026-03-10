SELECT
  t.track_sk,
  t.track_id,
  t.track_name,
  t.track_popularity,
  a.artist_sk,
  a.artist_name,
  al.album_sk,
  al.album_name
FROM {{ ref('dim_track') }} t
JOIN {{ ref('dim_artist') }} a
  ON t.artist_sk = a.artist_sk
JOIN {{ ref('dim_album') }} al
  ON t.album_sk = al.album_sk
ORDER BY
  t.track_popularity DESC,
  t.track_name
LIMIT 100
