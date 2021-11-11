select
orderid as order_id,
amount / 100 as amount
from sandbox_david.stripe_payments_csv
