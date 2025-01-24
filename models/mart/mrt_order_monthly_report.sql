WITH 
monthly_order_recap AS (
    SELECT  DATE_TRUNC(order_created_at,month) AS order_month,
            COUNT(DISTINCT user_id) AS total_monthly_users,
            COUNT(order_id) AS total_monthly_orders
    FROM {{ ref('stg_sales_database__order')}}
    GROUP BY order_month
), 
total_monthly_user_from_jawa_timur AS (
    SELECT DATE_TRUNC(order_created_at,month) AS order_month,
            COUNT(DISTINCT user.user_id) AS total_monthly_users_from_jawa_timur
    FROM {{ ref('stg_sales_database__order')}} AS orders
    LEFT JOIN {{ ref('stg_sales_database__user')}} AS user ON user.user_id = orders.user_id
    WHERE user.user_state LIKE '%JAWA%TIMUR%'
    GROUP BY order_month
)
SELECT o.order_month,
        COALESCE(o.total_monthly_users,0) AS total_monthly_users,
        COALESCE(jt.total_monthly_users_from_jawa_timur,0) AS total_monthly_users_from_jawa_timur,
        COALESCE(o.total_monthly_orders,0) AS total_monthly_orders
FROM monthly_order_recap AS o
LEFT JOIN total_monthly_user_from_jawa_timur AS jt ON jt.order_month = o.order_month
ORDER BY order_month