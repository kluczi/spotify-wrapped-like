WITH src AS (
    SELECT 
        *
    FROM
        {{ref('spotify_data_clean')}}
)

SELECT 
    {{ normalize_str('track_id') }} AS track_id,
    {{ normalize_str('track_name') }} AS track_name,
    track_number::int AS track_number,
    track_popularity::int AS track_popularity,
    explicit::boolean AS explicit,
    {{ normalize_str('artist_name') }} AS artist_name,
    artist_popularity::int AS artist_popularity,
    artist_followers::int AS artist_followers,
    nullif({{ normalize_str('artist_genres') }}, 'n/a') AS artist_genres,
    {{ normalize_str('album_id') }} AS album_id,
    {{ normalize_str('album_name') }} AS album_name,
    album_release_date::date AS album_release_date,
    album_total_tracks::int AS album_total_tracks,
    {{ normalize_str('album_type') }} AS album_type,
    track_duration_min::float AS track_duration_min
FROM src