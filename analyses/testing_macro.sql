{{ expression_is_true('mart_movies', "like 'Mufasa%'",'movie_id') }}



/*
{% macro expression_is_true (model, expression, column_name) %}
{% set column_list = '*' %}
select
    {{ column_list }}
from {{ model }}
{% if column_name is none %}
where not({{ expression }})
{%- else %}
where not({{ column_name }} {{ expression }})
{%- endif %}
{% endmacro %}
*/