SELECT
  artist_sk,
  artist_name,
  artist_followers,
  artist_popularity
FROM {{ ref('dim_artist') }}
ORDER BY
  artist_followers DESC,
  artist_popularity DESC,
  artist_name
LIMIT 100
