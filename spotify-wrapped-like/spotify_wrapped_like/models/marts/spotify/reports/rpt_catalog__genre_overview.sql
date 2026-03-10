SELECT
  g.genre_sk,
  g.genre,
  COUNT(DISTINCT ag.artist_sk) AS artist_count,
  COUNT(DISTINCT t.track_sk) AS track_count
FROM {{ ref('dim_genre') }} g
LEFT JOIN {{ ref('bridge_artist_genre') }} ag
  ON g.genre_sk = ag.genre_sk
LEFT JOIN {{ ref('dim_track') }} t
  ON t.artist_sk = ag.artist_sk
GROUP BY
  g.genre_sk,
  g.genre
ORDER BY
  track_count DESC,
  artist_count DESC,
  g.genre
