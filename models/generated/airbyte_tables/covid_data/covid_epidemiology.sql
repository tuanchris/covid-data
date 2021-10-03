{{ config(
    schema="covid_data",
    tags=["top-level"],
    partition_by={
        "field": "date",
        "data_type": "date"
    },
    cluster_by=["key"]
) }}
-- Final base SQL model
select
    key,
    date(date) as date,
    new_tested,
    new_deceased,
    total_tested,
    new_confirmed,
    new_recovered,
    total_deceased,
    total_confirmed,
    total_recovered,
    _airbyte_emitted_at,
    _airbyte_covid_epidemiology_hashid
from {{ ref('covid_epidemiology_ab3') }}
-- covid_epidemiology from {{ source('covid_data', '_airbyte_raw_covid_epidemiology') }}

