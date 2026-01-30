{% macro generate_dim_sk(column_names) %}
    {{ dbt_utils.generate_surrogate_key(column_names) }}
{% endmacro %}
