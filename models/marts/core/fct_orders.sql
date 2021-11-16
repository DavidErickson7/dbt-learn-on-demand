with customers as (

    select * from {{ ref('stg_customers') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),

orders as (

    select * from {{ ref('stg_orders')}}

),

order_payments as (

    select
    order_id,
    sum(amount) as amount
    from payments
    group by order_id
    
),

customer_payments as (
    select
    orders.customer_id,
    orders.order_id,
    order_payments.amount as amount
    from orders
    left join order_payments using (order_id)
    order by customer_id asc),

final as (
    select customer_id, 
    sum(amount) as lifetime_value
    from customer_payments
    group by (customer_id) 
    order by customer_id asc
)

Select customer_id, 
coalesce(lifetime_value,0) as lifetime_value
from customers 
left join final using (customer_id)