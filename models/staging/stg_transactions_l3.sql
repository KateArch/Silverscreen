select  details as movie_id,
        timestamp as "DATE",   
        amount as ticket_amount,
        total_value as revenue,
        'NJ_003' as location
from {{ source("silverscreen", "transactions_l3") }}
where product_type = 'ticket'