WITH src AS (
    SELECT 
        track_id,
        track_name,
        track_number,
        track_popularity,
        track_duration_min,
        explicit
    FROM 
        {{ref('stg_spotify_tracks')}}
)

SELECT 
    track_id,
    track_name,
    track_number,
    track_popularity,
    track_duration_min,
    explicit
FROM    
    src