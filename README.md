# IMDb Movie Data Engineering & Analytics

An end-to-end data engineering and analytics project that ingests IMDb movie data, transforms it into analytics-ready models, stores curated data in Databricks Delta tables, and visualizes insights in Power BI.

## Project Overview

This project demonstrates a data pipeline using AWS S3, Snowflake, dbt Core, Databricks, and Power BI. It covers data ingestion, transformation, data quality testing, analytics modeling, and dashboard development.

## Architecture

```text
IMDb CSV Dataset
       |
       v
AWS S3
       |
       v
Snowflake Snowpipe
       |
       v
dbt Core (Snowflake)
       |
       v
Databricks Delta Lake
       |
       v
Power BI Dashboard
```

**Documentation workflow:** dbt generates model metadata and lineage documentation from the dbt project.

## Technologies Used

- **AWS S3** — Source file storage
- **Snowflake** — Data warehouse and raw data ingestion
- **Snowpipe** — Automated file ingestion into Snowflake
- **dbt Core** — SQL transformations, modular modeling, and data quality tests
- **Databricks** — Curated Delta Lake tables and analytics data
- **Power BI** — Interactive dashboard and business reporting
- **Git & GitHub** — Version control and project source management
- **Python** — Virtual environment and local development support

## Data Models

The dbt project organizes transformations into staging, intermediate, and mart layers.

### Staging
- `stg_imdb_movies` — Standardizes the raw IMDb movie dataset.

### Intermediate
- `int_imdb_movies_cleaned` — Applies cleaning and validation logic.

### Marts
- `dim_movies` — Movie attributes and descriptive information
- `dim_actor` — Actor dimension
- `dim_genre` — Genre dimension
- `bridge_movie_actor` — Movie-to-actor relationships
- `bridge_movie_genre` — Movie-to-genre relationships
- `fact_movie_performance` — IMDb ratings, metascores, votes, gross revenue, and runtime

## Databricks Curated Tables

The curated tables are stored in the Databricks catalog and schema:

`etl_project.imdb`

| Table | Rows validated |
|---|---:|
| `dim_movies` | 1,000 |
| `dim_actor` | 2,709 |
| `dim_genre` | 21 |
| `bridge_movie_actor` | 3,996 |
| `bridge_movie_genre` | 2,541 |
| `fact_movie_performance` | 1,000 |

These counts reflect the validation results observed during development.

## Data Quality and Testing

The project includes dbt tests and custom SQL tests for checks such as:

- IMDb rating validity
- Release year validity
- Runtime validity
- Vote count validity
- Unique movie-actor relationships
- Unique movie-genre relationships
- Key uniqueness and referential integrity checks in the curated data

The last reported full dbt build completed with 23 passing checks and no warnings or errors. Test counts may change as the project evolves.

Missing metascores and gross revenue values are preserved as null where the source data does not provide them.

## Power BI Dashboard

The dashboard includes:

- Total movies
- Average IMDb rating
- Total votes
- Total gross revenue
- Average runtime
- Average metascore
- IMDb rating distribution
- Top 5 movies by IMDb rating
- Movies by genre
- Top 5 actors by number of movies
- Top 10 movies by gross revenue
- Release Year, Certificate, and Genre slicers

The report is designed to support interactive exploration of movie performance and characteristics.

## Getting Started

### Prerequisites

- Python and a virtual environment
- dbt Core with the Snowflake adapter
- Access to a Snowflake account and the required database objects
- Git
- Databricks and Power BI for the downstream analytics workflow

### 1. Clone the repository

```bash
git clone https://github.com/Richa-pawar/IMDB_MOVIE_DBT_Analysis.git
cd IMDB_MOVIE_DBT_Analysis
```

### 2. Create and activate a virtual environment

On Windows PowerShell:

```powershell
python -m venv dbt_venv
.\dbt_venv\Scripts\Activate.ps1
```

### 3. Install dbt

```powershell
pip install dbt-snowflake
```

### 4. Configure Snowflake credentials

Configure your dbt profile in `profiles.yml`, typically located at:

`%USERPROFILE%\.dbt\profiles.yml`

Use your own Snowflake account details and authentication method. Do not commit passwords, private keys, or other credentials to GitHub.

### 5. Validate the project

Run these commands from the directory containing `dbt_project.yml`:

```bash
dbt debug
dbt parse
dbt build
```

`dbt build` runs applicable model builds and tests according to the project's configuration.

## Generate dbt Documentation

Generate the documentation artifacts:

```bash
dbt docs generate
```

Start the local documentation server:

```bash
dbt docs serve
```

Open the local URL displayed in your terminal, commonly `http://localhost:8080`.

The documentation site lets you explore model metadata, columns, tests, and model lineage. Documentation reflects the metadata and descriptions defined in the project.

Generated artifacts in `target/` are generally not committed; regenerate them locally when needed.

## Repository Structure

```text
IMDB_MOVIE_DBT_Analysis/
├── analyses/
├── macros/
├── models/
│   ├── staging/
│   ├── intermediate/
│   └── marts/
├── seeds/
├── snapshots/
├── tests/
├── dbt_project.yml
├── README.md
└── .gitignore
```

## Security

- Never commit Snowflake passwords, private keys, or access tokens.
- Keep local environment and credential files out of version control.
- Use appropriate permissions for AWS, Snowflake, and Databricks access.

## Future Enhancements

- Automate pipeline execution and scheduling.
- Add pipeline run logging and operational monitoring.
- Expand data quality checks and documentation descriptions.
- Integrate automated deployment and continuous integration.

## Author

**Richa Pawar**

GitHub repository: [IMDB_MOVIE_DBT_Analysis](https://github.com/Richa-pawar/IMDB_MOVIE_DBT_Analysis)