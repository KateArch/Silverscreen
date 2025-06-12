SELECT *
FROM {{ ref('int_movies_costs') }}
WHERE month> CURRENT_DATE()