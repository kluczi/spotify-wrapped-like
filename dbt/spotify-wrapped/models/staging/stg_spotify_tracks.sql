with src as (
  select * from {{ ref('spotify_data_clean') }}
)

select
  *
from src
