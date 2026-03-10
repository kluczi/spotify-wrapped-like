SELECT
  t.track_sk,
  t.track_id,
  t.track_name,
  t.track_popularity,
  a.artist_sk,
  a.artist_name,
  a.artist_popularity,
  a.artist_followers
FROM {{ ref('dim_track') }} t
JOIN {{ ref('dim_artist') }} a
  ON t.artist_sk = a.artist_sk
WHERE t.track_popularity >= 70
  AND a.artist_popularity <= 50
ORDER BY
  t.track_popularity DESC,
  a.artist_popularity ASC,
  a.artist_name,
  t.track_name
LIMIT 100
