select 
    orderid as order_id,
    amount
from raw.stripe.payment
WHERE
    status = 'success'