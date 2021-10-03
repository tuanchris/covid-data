{{ config(schema="_airbyte_covid_data", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['key'], ['key']) }} as key,
    {{ json_extract_scalar('_airbyte_data', ['date'], ['date']) }} as date,
    {{ json_extract_scalar('_airbyte_data', ['new_tested'], ['new_tested']) }} as new_tested,
    {{ json_extract_scalar('_airbyte_data', ['new_deceased'], ['new_deceased']) }} as new_deceased,
    {{ json_extract_scalar('_airbyte_data', ['total_tested'], ['total_tested']) }} as total_tested,
    {{ json_extract_scalar('_airbyte_data', ['new_confirmed'], ['new_confirmed']) }} as new_confirmed,
    {{ json_extract_scalar('_airbyte_data', ['new_recovered'], ['new_recovered']) }} as new_recovered,
    {{ json_extract_scalar('_airbyte_data', ['total_deceased'], ['total_deceased']) }} as total_deceased,
    {{ json_extract_scalar('_airbyte_data', ['total_confirmed'], ['total_confirmed']) }} as total_confirmed,
    {{ json_extract_scalar('_airbyte_data', ['total_recovered'], ['total_recovered']) }} as total_recovered,
    _airbyte_emitted_at
from {{ source('covid_data', '_airbyte_raw_covid_epidemiology') }} as table_alias
-- covid_epidemiology

