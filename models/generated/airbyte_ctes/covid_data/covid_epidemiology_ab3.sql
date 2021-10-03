{{ config(schema="_airbyte_covid_data", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        'key',
        'date',
        'new_tested',
        'new_deceased',
        'total_tested',
        'new_confirmed',
        'new_recovered',
        'total_deceased',
        'total_confirmed',
        'total_recovered',
    ]) }} as _airbyte_covid_epidemiology_hashid,
    tmp.*
from {{ ref('covid_epidemiology_ab2') }} tmp
-- covid_epidemiology

