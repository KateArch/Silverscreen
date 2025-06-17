select  movie_id,
        date,   
        ticket_amount,
        total_earned as revenue,
        'NJ_002' as location
from {{ source("silverscreen", "transactions_l2") }}
where movie_id is not null