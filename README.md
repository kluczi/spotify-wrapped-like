# Spotify Wrapped-Like Analytics Project

A data analytics project that transforms Spotify listening data into a dimensional data model, similar to Spotify Wrapped. This project uses modern data engineering practices to create a comprehensive analytics platform for exploring music listening patterns.

## Project Overview

This project processes raw Spotify track data and transforms it into a star schema data model, enabling analysis of:
- Track popularity and metrics
- Artist information and genres
- Album details and release information
- Genre-based analytics
- Listening patterns and trends

## Tech Stack

### Core Technologies
- **dbt (data build tool)** - Data transformation and modeling
  - dbt-core
  - dbt-postgres adapter
- **PostgreSQL** - Data warehouse (PostgreSQL 16)
- **Python** - Runtime environment (Python 3.12)
- **Docker & Docker Compose** - Containerization and orchestration

### Dependencies
- **dbt_utils** (>=1.1.0, <2.0.0) - Utility macros for dbt

## Files Structure

```
spotify-wrapped-like/
├── docker-compose.yml          # Docker services configuration
└── spotify_wrapped_like/       # dbt project root
    ├── dbt_project.yml         # dbt project configuration
    ├── profiles.yml            # Database connection profiles
    ├── packages.yml            # dbt package dependencies
    ├── Dockerfile              # dbt container image
    ├── models/
    │   ├── staging/            # Staging layer (views)
    │   │   ├── stg_spotify_tracks.sql
    │   │   └── schema.yml
    │   ├── intermediate/       # Intermediate transformations (views)
    │   │   └── spotify/
    │   │       └── int_artist_genre_exploded.sql
    │   └── marts/              # Marts layer (tables)
    │       └── spotify/
    │           ├── dim/        # Dimension tables
    │           │   ├── dim_album.sql
    │           │   ├── dim_artist.sql
    │           │   ├── dim_track.sql
    │           │   ├── dim_genre.sql
    │           │   └── dim_artists_genre.sql
    │           ├── fct/        # Fact tables
    │           │   └── fct_spotify_popularity.sql
    │           ├── bridge_artist_genre.sql
    │           └── schema.yml
    └── seeds/                  # Raw data files
        └── spotify_data_clean.csv
```

## Getting Started

### Prerequisites
- Docker and Docker Compose installed

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd spotify-wrapped-like-project
   ```

2. **Create environment file**
   Create a `.env` file in the root directory:
   ```env
   POSTGRES_DB=spotify_db
   POSTGRES_USER=spotify_user
   POSTGRES_PASSWORD=your_secure_password
   POSTGRES_PORT=5432
   DBT_TARGET=dev
   ```

3. **Start the services**
   ```bash
   docker-compose up -d
   ```

4. **Access the dbt container**
   ```bash
   docker exec -it dbt bash
   ```

5. **Install dbt packages**
   ```bash
   dbt deps
   ```

6. **Load seed data**
   ```bash
   dbt seed
   ```

7. **Run transformations**
   ```bash
   dbt run
   ```

8. **Run tests**
   ```bash
   dbt test
   ```


## Usage

### Running dbt Commands

All dbt commands should be run inside the dbt container:

```bash
# Enter the container
docker exec -it dbt bash

# Run all models
dbt run

# Run specific model
dbt run --select stg_spotify_tracks

# Run models in a specific directory
dbt run --select models/staging/*

# Run tests
dbt test

# Generate documentation
dbt docs generate
dbt docs serve

# View project structure
dbt list
```

### Materialization Strategy
- **Staging models**: Views (for performance and freshness)
- **Intermediate models**: Views (for transformation pipeline)
- **Marts models**: Tables (for query performance)

## Data Quality

The project includes comprehensive data quality tests:
- **Uniqueness tests**: Primary keys (track_id, album_id, artist_name)
- **Not null tests**: Required fields
- **Accepted range tests**: Numeric value validation (popularity scores, track numbers)
- **Accepted values tests**: Enum validation (album types)
- **Expression tests**: Custom business logic validation



