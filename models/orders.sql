with orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

)

SELECT
    order_id,
    customer_id,
    SUM(COALESCE(amount, 0))/100 as amount
FROM orders

LEFT JOIN payments using (order_id)

GROUP BY
    order_id, customer_id