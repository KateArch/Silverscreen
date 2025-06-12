select  movie_id,
        timestamp as "DATE",   
        ticket_amount,
        transaction_total as revenue,
        'NJ_001' as location
from {{ source("silverscreen", "transactions_l1") }}
