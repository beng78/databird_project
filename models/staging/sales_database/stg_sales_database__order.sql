select
    order_id AS order_id_Y,
    user_name AS user_id_X,
    order_status AS order_status_X,
    DATETIME(order_date, "Europe/Paris") AS order_created_at_X,
    DATETIME(order_approved_date, "Europe/Paris") AS order_approved_at_X,
    DATETIME(pickup_date, "Europe/Paris") AS picked_up_at_X,
    DATETIME(delivered_date, "Europe/Paris") AS delivered_at_X,
    DATETIME(estimated_time_delivery, "Europe/Paris") AS estimated_time_delivery_X
from {{ source('sales_database', 'order') }}