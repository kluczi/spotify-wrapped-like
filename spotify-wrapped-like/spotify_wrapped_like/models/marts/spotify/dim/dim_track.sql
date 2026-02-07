WITH src AS (
    SELECT 
        {{ generate_dim_sk(['track_id']) }} AS track_sk,
        {{ generate_dim_sk(['album_id']) }} AS album_sk,
        {{ generate_dim_sk(['artist_name']) }} AS artist_sk,
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
    album_sk,
    artist_sk,
    track_id,
    track_name,
    track_number,
    track_popularity,
    track_duration_min,
    explicit
FROM    
    src