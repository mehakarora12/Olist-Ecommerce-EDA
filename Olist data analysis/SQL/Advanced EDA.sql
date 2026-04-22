-- Advance EDA
-- Orders Growth Over Time
SELECT 
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-- New Customers Over Time
SELECT 
    first_month,
    COUNT(*) AS new_customers
FROM (
    SELECT 
        c.customer_unique_id,
        DATE_FORMAT(MIN(o.order_purchase_timestamp), '%Y-%m') AS first_month
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
) t
GROUP BY first_month
ORDER BY first_month;

-- Late Delivery Analysis
SELECT 
    CASE 
        WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 'Late'
        ELSE 'On Time'
    END AS delivery_status,
    COUNT(*) AS total_orders
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY 
    CASE 
        WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 'Late'
        ELSE 'On Time'
    END;
    
-- Category vs review score
SELECT 
    p.product_category_name,
    ROUND(AVG(r.review_score),2) AS avg_rating
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN order_reviews r ON oi.order_id = r.order_id
GROUP BY p.product_category_name
ORDER BY avg_rating DESC; 

-- Price vs Review
SELECT 
    CASE 
        WHEN oi.price < 50 THEN 'Low (<50)'
        WHEN oi.price BETWEEN 50 AND 200 THEN 'Medium (50-200)'
        WHEN oi.price BETWEEN 200 AND 500 THEN 'High (200-500)'
        ELSE 'Premium (>500)'
    END AS price_range,
    ROUND(AVG(r.review_score),2) AS avg_rating,
    COUNT(*) AS total_products
FROM order_items oi
JOIN order_reviews r ON oi.order_id = r.order_id
GROUP BY price_range
ORDER BY avg_rating DESC;
