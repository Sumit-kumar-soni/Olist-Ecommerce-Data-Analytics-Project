-- 5. Popular payment methods for repeat customers
-- Mostly people use Credit card for shoppings.

WITH RepeatCustomers AS (
    SELECT 
			c.customer_unique_id AS Customer_unique_id
	FROM Orders o
			INNER JOIN Customers c ON o.customer_id = c.customer_id
    GROUP BY customer_unique_id
	HAVING COUNT(o.order_id) > 1
)

SELECT
		p.payment_type AS Payment_type,
		COUNT(p.order_id) AS Usage_count
FROM order_payments p
		INNER JOIN orders o ON p.order_id = o.order_id
		INNER JOIN customers c ON o.customer_id = c.customer_id
		INNER JOIN RepeatCustomers rc ON c.customer_unique_id = rc.Customer_unique_id
GROUP BY p.payment_type
ORDER BY usage_count DESC;