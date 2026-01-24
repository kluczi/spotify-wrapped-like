with src as (
    select 
        *
    from
        {{ref('spotify_data_clean')}}
)

select 
    trim(track_id) as track_id,
    trim(track_name) as track_name,
    track_number::int as track_number,
    track_popularity::int as track_popularity,
    explicit::boolean as explicit,
    trim(artist_name) as artist_name,
    artist_popularity::int as artist_popularity,
    artist_followers::int as artist_followers,
    nullif(trim(artist_genres), 'N/A') as artist_genres,
    trim(album_id) as album_id,
    trim(album_name) as album_name,
    album_release_date::date as album_release_date,
    album_total_tracks::int as album_total_tracks,
    trim(album_type) as album_type,
    track_duration_min::double precision as track_duration_min
from src