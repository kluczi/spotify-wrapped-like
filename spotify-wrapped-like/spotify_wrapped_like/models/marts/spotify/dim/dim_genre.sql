SELECT
  {{ dbt_utils.generate_surrogate_key(['genre']) }} AS genre_sk,
  genre
FROM (
  SELECT DISTINCT genre
  FROM {{ ref('int_artist_genre_exploded') }}
) g
WHERE genre IS NOT NULL
