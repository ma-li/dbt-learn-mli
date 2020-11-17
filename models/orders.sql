with orders as (
    select 
        order_id,
        customer_id
     from {{ ref('stg_orders') }}

),

payments as (
    select 
        order_id,
        COALESCE(amount/100, 0) as amount
    from {{ ref('stg_payments') }}
    where
        order_status = 'success'

)

SELECT
    order_id,
    customer_id,
    SUM(amount) as amount
    
FROM orders

LEFT JOIN payments using (order_id)

GROUP BY
    order_id, customer_id