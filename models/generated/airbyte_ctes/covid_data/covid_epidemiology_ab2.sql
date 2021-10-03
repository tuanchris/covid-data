{{ config(schema="_airbyte_covid_data", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast(key as {{ dbt_utils.type_string() }}) as key,
    cast(date as {{ dbt_utils.type_string() }}) as date,
    cast(new_tested as {{ dbt_utils.type_float() }}) as new_tested,
    cast(new_deceased as {{ dbt_utils.type_float() }}) as new_deceased,
    cast(total_tested as {{ dbt_utils.type_float() }}) as total_tested,
    cast(new_confirmed as {{ dbt_utils.type_float() }}) as new_confirmed,
    cast(new_recovered as {{ dbt_utils.type_float() }}) as new_recovered,
    cast(total_deceased as {{ dbt_utils.type_float() }}) as total_deceased,
    cast(total_confirmed as {{ dbt_utils.type_float() }}) as total_confirmed,
    cast(total_recovered as {{ dbt_utils.type_float() }}) as total_recovered,
    _airbyte_emitted_at
from {{ ref('covid_epidemiology_ab1') }}
-- covid_epidemiology

