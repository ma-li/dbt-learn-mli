SELECT 
    orderid as order_id,
    status as order_status,
    amount as payment_amount
FROM raw.stripe.payment

