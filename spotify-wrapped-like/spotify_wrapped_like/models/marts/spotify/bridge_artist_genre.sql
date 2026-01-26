SELECT DISTINCT  
    e.artist_name,
    d.genre_sk
FROM {{ ref('int_artist_genre_exploded') }} e
JOIN {{ ref('dim_genre') }} d
  ON e.genre = d.genre
