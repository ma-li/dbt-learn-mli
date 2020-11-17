SELECT 
    orderid as order_id,
    status as order_status,
    amount
FROM raw.stripe.payment

