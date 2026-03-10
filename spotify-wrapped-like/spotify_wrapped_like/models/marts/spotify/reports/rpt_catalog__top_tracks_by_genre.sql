WITH ranked AS (
  SELECT
    g.genre_sk,
    g.genre,
    t.track_sk,
    t.track_id,
    t.track_name,
    t.track_popularity,
    a.artist_sk,
    a.artist_name,
    ROW_NUMBER() OVER (
      PARTITION BY g.genre_sk
      ORDER BY t.track_popularity DESC, t.track_name
    ) AS genre_rank
  FROM {{ ref('dim_track') }} t
  JOIN {{ ref('dim_artist') }} a
    ON t.artist_sk = a.artist_sk
  JOIN {{ ref('bridge_artist_genre') }} ag
    ON t.artist_sk = ag.artist_sk
  JOIN {{ ref('dim_genre') }} g
    ON ag.genre_sk = g.genre_sk
)
SELECT
  genre_sk,
  genre,
  track_sk,
  track_id,
  track_name,
  track_popularity,
  artist_sk,
  artist_name,
  genre_rank
FROM ranked
WHERE genre_rank <= 10
ORDER BY
  genre,
  genre_rank
