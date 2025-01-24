select
    order_id,
    user_name as user_id,
    order_status,
    DATETIME(order_date, "Europe/Paris") AS order_created_atx,
    DATETIME(order_approved_date, "Europe/Paris") AS order_approved_atx,
    DATETIME(pickup_date, "Europe/Paris") AS picked_up_atx,
    DATETIME(delivered_date, "Europe/Paris") AS delivered_atx,
    DATETIME(estimated_time_delivery, "Europe/Paris") AS estimated_time_deliveryx
from {{ source('sales_database', 'order') }}