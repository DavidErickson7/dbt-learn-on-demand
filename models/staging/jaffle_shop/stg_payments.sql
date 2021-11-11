select
orderid as order_id,
amount
from sandbox_david.stripe_payments_csv
where status = 'success'
