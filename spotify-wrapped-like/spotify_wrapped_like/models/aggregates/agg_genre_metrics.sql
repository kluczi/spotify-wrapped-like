WITH src AS (
    SELECT 
        gen.genre AS genre,
        COUNT(tra.track_sk) AS tracks_count,
        COUNT(gen.artist_sk) AS artists_count,
        AVG(art.artist_followers) AS avg_artist_followers,
        AVG(tra.track_popularity) AS avg_track_popularity

    FROM    
        {{ref('dim_artist_genre')}} gen 
        JOIN {{ref('dim_artist')}} art ON gen.artist_sk=art.artist_sk
        JOIN {{ref('dim_track')}} tra ON art.artist_sk=tra.artist_sk
    GROUP BY 1
)

SELECT DISTINCT
    genre, 
    tracks_count, 
    artists_count,
    avg_artist_followers,
    avg_track_popularity
FROM src