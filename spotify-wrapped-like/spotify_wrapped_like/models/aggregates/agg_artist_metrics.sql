WITH src as (
    SELECT
        art.artist_name AS artist_name,
        art.artist_followers AS artist_followers,
        COUNT(gen.genre_sk) AS genres_count,
        COUNT(alb.album_sk) AS albums_count,
        COUNT(tra.track_popularity) AS tracks_count,
        AVG(tra.track_popularity) AS avg_track_popularity,
        MAX(tra.track_popularity) AS max_track_popularity
    FROM 
        {{ref('dim_artist')}} art
        JOIN {{ref('dim_artist_genre')}} gen ON art.artist_sk=gen.artist_sk
        JOIN {{ref('dim_track')}} tra ON tra.artist_sk=art.artist_sk
        JOIN {{ref('dim_album')}} alb ON tra.album_sk=alb.album_sk 
    GROUP BY 1,2
)

SELECT DISTINCT
    artist_name,
    artist_followers,
    genres_count,
    albums_count,
    tracks_count,
    avg_track_popularity,
    max_track_popularity
FROM src
