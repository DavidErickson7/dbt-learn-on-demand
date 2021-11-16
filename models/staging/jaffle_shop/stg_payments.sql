select
orderid as order_id,
amount / 100 as amount
from {{source('sandbox_david', 'stripe_payments_csv')}}
