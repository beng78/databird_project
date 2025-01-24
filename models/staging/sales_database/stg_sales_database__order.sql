select
    order_id,
    user_name as user_id,
    order_status,
    DATETIME(order_date, "Europe/Paris") AS order_created_aty,
    DATETIME(order_approved_date, "Europe/Paris") AS order_approved_ayt,
    DATETIME(pickup_date, "Europe/Paris") AS picked_up_aty,
    DATETIME(delivered_date, "Europe/Paris") AS delivered_aty,
    DATETIME(estimated_time_delivery, "Europe/Paris") AS estimated_time_deliveryy
from {{ source('sales_database', 'order') }}