-- Customer Distribution by State 
SELECT 
    customer_state,
    COUNT(DISTINCT customer_id) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

-- Customer Order Frequency Distribution
SELECT 
    order_count,
    COUNT(*) AS num_customers,
    ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM (
    SELECT 
        c.customer_unique_id,
        COUNT(o.order_id) AS order_count
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
) t
GROUP BY order_count
ORDER BY order_count;

-- Repeat vs One-time Customers
SELECT 
    CASE 
        WHEN order_count = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS total_customers
FROM (
    SELECT 
        c.customer_unique_id,
        COUNT(o.order_id) AS order_count
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
) t
GROUP BY customer_type;

-- customer city with highest orders
SELECT 
    c.customer_city,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_city
ORDER BY total_orders DESC
LIMIT 10;

-- Seller Distribution by state
SELECT 
    seller_state,
    COUNT(*) AS total_sellers
FROM sellers
GROUP BY seller_state
ORDER BY total_sellers DESC;

-- Sellers with Most Products Sold
SELECT 
    seller_id,
    COUNT(order_id) AS total_orders
FROM order_items
GROUP BY seller_id
ORDER BY total_orders DESC
LIMIT 10;

-- Seller Activity (Unique Orders)
SELECT 
    seller_id,
    COUNT(DISTINCT order_id) AS unique_orders
FROM order_items
GROUP BY seller_id
ORDER BY unique_orders DESC
LIMIT 10;

-- Customers interacting with multiple sellers
SELECT 
    o.customer_id,
    COUNT(DISTINCT oi.seller_id) AS seller_count
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY seller_count DESC
LIMIT 10;

-- Sellers serving multiple customers
SELECT 
    oi.seller_id,
    COUNT(DISTINCT o.customer_id) AS customer_count
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
GROUP BY oi.seller_id
ORDER BY customer_count DESC
LIMIT 10;

-- Top Customer–Seller Pairs
SELECT 
    o.customer_id,
    oi.seller_id,
    COUNT(*) AS interactions
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.customer_id, oi.seller_id
ORDER BY interactions DESC
LIMIT 10;

-- Customer Lifetime (order spread)
SELECT 
    customer_id,
    MIN(order_purchase_timestamp) AS first_order,
    MAX(order_purchase_timestamp) AS last_order
FROM orders
GROUP BY customer_id;

