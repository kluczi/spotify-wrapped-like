{% macro normalize_str(column_name) %}
    lower(trim({{ column_name }}))
{% endmacro %}
