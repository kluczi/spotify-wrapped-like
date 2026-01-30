SELECT
  {{ generate_dim_sk(['genre']) }} AS genre_sk,
  genre
FROM (
  SELECT DISTINCT genre
  FROM {{ ref('int_artist_genre_exploded') }}
) g
WHERE genre IS NOT NULL
