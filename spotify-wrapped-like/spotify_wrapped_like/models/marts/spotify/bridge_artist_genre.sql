SELECT DISTINCT
    e.artist_name,
    d.genre_sk
FROM {{ ref('int_artist_genre_exploded') }} e
JOIN {{ ref('dim_genre') }} d
  ON {{ normalize_str('e.genre') }} = {{ normalize_str('d.genre') }}
