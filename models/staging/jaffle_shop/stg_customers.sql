select
    id as customer_id,
    first_name,
    last_name

from {{source('sandbox_david','jaffle_shop_customers_csv')}}