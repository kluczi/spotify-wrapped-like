WITH src AS (
    SELECT
        alb.album_name AS album_name,
        MAX(tra.track_number) AS album_total_tracks
        SUM(tra.track_duration_min) AS album_total_duration
        AVG(tra.track_popularity) AS avg_album_track_popularity
    FROM    
        {{ref('dim_album')}} alb JOIN {{ref('dim_track')}} tra ON alb.album_sk=tra.album_sk
    GROUP BY 1
)

SELECT DISTINCT 
    album_name,
    album_total_tracks,
    album_total_duration,
    avg_album_track_popularity
FROM    
    src