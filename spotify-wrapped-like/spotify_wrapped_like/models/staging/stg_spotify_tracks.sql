WITH src AS (
    SELECT 
        *
    FROM
        {{ref('spotify_data_clean')}}
)

SELECT 
    trim(track_id) AS track_id,
    trim(track_name) AS track_name,
    track_number::int AS track_number,
    track_popularity::int AS track_popularity,
    explicit::boolean AS explicit,
    trim(artist_name) AS artist_name,
    artist_popularity::int AS artist_popularity,
    artist_followers::int AS artist_followers,
    nullif(trim(artist_genres), 'N/A') AS artist_genres,
    trim(album_id) AS album_id,
    trim(album_name) AS album_name,
    album_release_date::date AS album_release_date,
    album_total_tracks::int AS album_total_tracks,
    trim(album_type) AS album_type,
    track_duration_min::float AS track_duration_min
FROM src