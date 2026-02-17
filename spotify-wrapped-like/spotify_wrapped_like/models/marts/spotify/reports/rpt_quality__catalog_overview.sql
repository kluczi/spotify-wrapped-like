SELECT
  (SELECT COUNT(*) FROM {{ ref('dim_artist') }}) AS artists_count,
  (SELECT COUNT(*) FROM {{ ref('dim_album') }}) AS albums_count,
  (SELECT COUNT(*) FROM {{ ref('dim_track') }}) AS tracks_count,
  (SELECT COUNT(*) FROM {{ ref('dim_genre') }}) AS genres_count,
  AVG(CASE WHEN t.explicit THEN 1.0 ELSE 0.0 END) AS explicit_track_share,
  AVG(CASE WHEN ag.artist_sk IS NULL THEN 1.0 ELSE 0.0 END) AS artists_without_genre_share
FROM {{ ref('dim_track') }} t
LEFT JOIN {{ ref('bridge_artist_genre') }} ag
  ON t.artist_sk = ag.artist_sk;
