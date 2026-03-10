SELECT
  a.artist_sk,
  a.artist_name,
  COUNT(DISTINCT ag.genre_sk) AS genre_count
FROM {{ ref('dim_artist') }} a
LEFT JOIN {{ ref('dim_artist_genre') }} ag
  ON a.artist_sk = ag.artist_sk
GROUP BY
  a.artist_sk,
  a.artist_name
ORDER BY
  genre_count DESC,
  a.artist_name
LIMIT 100
