with a as (
select invoice_id
from {{ source("silverscreen", "invoices") }}
group by invoice_id
having count(invoice_id) > 1
)

select *
from {{ source("silverscreen", "invoices") }} i
join a
on a.invoice_id=i.invoice_id
order by a.invoice_id