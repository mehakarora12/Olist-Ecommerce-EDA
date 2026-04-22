### Handling Missing values in orders table  ##
UPDATE orders
SET order_approved_at = NULL
WHERE order_approved_at = '';

UPDATE orders
SET order_delivered_customer_date = NULL
WHERE order_delivered_customer_date = '';

ALTER TABLE orders
ADD COLUMN delivery_status VARCHAR(20);

UPDATE orders
SET delivery_status = 
CASE
    WHEN order_delivered_customer_date IS NULL THEN 'Not Delivered'
    ELSE 'Delivered'
END;

##order reviews ##
ALTER TABLE order_reviews
ADD COLUMN review_type VARCHAR(20);

UPDATE order_reviews
SET review_type =
CASE
    WHEN review_comment_message IS NULL OR review_comment_message = '' THEN 'No Text Review'
    ELSE 'Text Review'
END;

##products table ##
UPDATE products
SET product_category_name = 'Unknown'
WHERE product_category_name IS NULL OR product_category_name = '';

UPDATE products
SET product_weight_g = 0
WHERE product_weight_g IS NULL OR product_weight_g = '';


