select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from {{source('sandbox_david','jaffle_shop_orders_csv')}}