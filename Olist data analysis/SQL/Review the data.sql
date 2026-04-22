-- Review all the data & checking for missing values
USE olist_db;

-- Row counts for all your tables
SELECT 'customers'                  AS table_name, COUNT(*) AS total_rows FROM customers
UNION ALL SELECT 'geolocation',                    COUNT(*) FROM geolocation
UNION ALL SELECT 'order_items',                    COUNT(*) FROM order_items
UNION ALL SELECT 'order_payments',                 COUNT(*) FROM order_payments
UNION ALL SELECT 'order_reviews',                  COUNT(*) FROM order_reviews
UNION ALL SELECT 'orders',                         COUNT(*) FROM orders
UNION ALL SELECT 'product_category_name_translation',        COUNT(*) FROM product_category_name_translation
UNION ALL SELECT 'products',                       COUNT(*) FROM products
UNION ALL SELECT 'sellers',                        COUNT(*) FROM sellers;

-- Preview each table structure
DESCRIBE customers;
DESCRIBE orders;
DESCRIBE order_items;
DESCRIBE order_payments;
DESCRIBE order_reviews;
DESCRIBE products;
DESCRIBE sellers;
DESCRIBE geolocation;
DESCRIBE product_category_name_translation;


## orders null values ###
SELECT 
    COUNT(*) AS total_rows,
    
    SUM(CASE WHEN customer_id IS NULL OR customer_id = '' THEN 1 ELSE 0 END) AS missing_customer_id,
    SUM(CASE WHEN customer_unique_id IS NULL OR customer_unique_id = '' THEN 1 ELSE 0 END) AS missing_unique_id,
    SUM(CASE WHEN customer_zip_code_prefix IS NULL OR customer_zip_code_prefix = '' THEN 1 ELSE 0 END) AS missing_zip,
    SUM(CASE WHEN customer_city IS NULL OR customer_city = '' THEN 1 ELSE 0 END) AS missing_city,
    SUM(CASE WHEN customer_state IS NULL OR customer_state = '' THEN 1 ELSE 0 END) AS missing_state

FROM customers;

SELECT 
    COUNT(*) AS total_rows,

    SUM(CASE WHEN order_id IS NULL OR order_id = '' THEN 1 ELSE 0 END) AS missing_order_id,
    SUM(CASE WHEN customer_id IS NULL OR customer_id = '' THEN 1 ELSE 0 END) AS missing_customer_id,
    SUM(CASE WHEN order_status IS NULL OR order_status = '' THEN 1 ELSE 0 END) AS missing_status,
    SUM(CASE WHEN order_purchase_timestamp IS NULL OR order_purchase_timestamp = '' THEN 1 ELSE 0 END) AS missing_purchase_date,
    SUM(CASE WHEN order_approved_at IS NULL OR order_approved_at = '' THEN 1 ELSE 0 END) AS missing_approved_date,
    SUM(CASE WHEN order_delivered_customer_date IS NULL OR order_delivered_customer_date = '' THEN 1 ELSE 0 END) AS missing_delivery_date

FROM orders;

SELECT 
    COUNT(*) AS total_rows,

    SUM(CASE WHEN order_id IS NULL OR order_id = '' THEN 1 ELSE 0 END) AS missing_order_id,
    SUM(CASE WHEN product_id IS NULL OR product_id = '' THEN 1 ELSE 0 END) AS missing_product,
    SUM(CASE WHEN seller_id IS NULL OR seller_id = '' THEN 1 ELSE 0 END) AS missing_seller,
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS missing_price,
    SUM(CASE WHEN freight_value IS NULL THEN 1 ELSE 0 END) AS missing_freight

FROM order_items;

SELECT 
    COUNT(*) AS total_rows,

    SUM(CASE WHEN payment_type IS NULL OR payment_type = '' THEN 1 ELSE 0 END) AS missing_payment_type,
    SUM(CASE WHEN payment_installments IS NULL THEN 1 ELSE 0 END) AS missing_installments,
    SUM(CASE WHEN payment_value IS NULL THEN 1 ELSE 0 END) AS missing_value

FROM order_payments;

SELECT 
    COUNT(*) AS total_rows,

    SUM(CASE WHEN review_score IS NULL THEN 1 ELSE 0 END) AS missing_score,
    SUM(CASE WHEN review_comment_message IS NULL OR review_comment_message = '' THEN 1 ELSE 0 END) AS missing_comment

FROM order_reviews;

SELECT 
    COUNT(*) AS total_rows,

    SUM(CASE WHEN product_category_name IS NULL OR product_category_name = '' THEN 1 ELSE 0 END) AS missing_category,
    SUM(CASE WHEN product_weight_g IS NULL OR product_weight_g = '' THEN 1 ELSE 0 END) AS missing_weight

FROM products;

SELECT 
    COUNT(*) AS total_rows,

    SUM(CASE WHEN seller_city IS NULL OR seller_city = '' THEN 1 ELSE 0 END) AS missing_city,
    SUM(CASE WHEN seller_state IS NULL OR seller_state = '' THEN 1 ELSE 0 END) AS missing_state

FROM sellers;

SELECT 
    COUNT(*) AS total_rows,

    SUM(CASE WHEN geolocation_lat IS NULL OR geolocation_lat = '' THEN 1 ELSE 0 END) AS missing_lat,
    SUM(CASE WHEN geolocation_lng IS NULL OR geolocation_lng = '' THEN 1 ELSE 0 END) AS missing_lng

FROM geolocation;

SELECT 
    COUNT(*) AS total_rows,

    SUM(CASE WHEN product_category_name IS NULL OR product_category_name = '' THEN 1 ELSE 0 END) AS missing_portuguese,
    SUM(CASE WHEN product_category_name_english IS NULL OR product_category_name_english = '' THEN 1 ELSE 0 END) AS missing_english

FROM product_category_name_translation;

