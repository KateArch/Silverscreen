SELECT 
    movie_id,
    movie_title, 
    COALESCE (genre, 'unknown') as genre,
    studio
FROM {{ source('silverscreen', 'movie_catalogue') }}
