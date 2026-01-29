WITH src AS (
    SELECT 
        {{ dbt_utils.generate_surrogate_key(['track_id']) }} AS track_sk,
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
    track_sk,
    track_id,
    track_name,
    track_number,
    track_popularity,
    track_duration_min,
    explicit
FROM    
    src