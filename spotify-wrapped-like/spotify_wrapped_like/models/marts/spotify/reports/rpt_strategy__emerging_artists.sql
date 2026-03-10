SELECT
  artist_sk,
  artist_name,
  artist_followers,
  artist_popularity
FROM {{ ref('dim_artist') }}
WHERE artist_followers IS NOT NULL
ORDER BY artist_popularity DESC, artist_followers ASC, artist_name
LIMIT 50
