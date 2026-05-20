-- 10. Customer retention rate after first purchase
-- Returning customers is 2997 and our total unique customer is 96096

WITH FirstPurchase AS (
	SELECT
			c.customer_unique_id AS Customer_unique_id,
			MIN(o.order_purchase_timestamp) AS First_order_date
	FROM Customers c
			INNER JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
    HAVING COUNT(DISTINCT o.order_id) > 1
)

SELECT
		COUNT(DISTINCT c.customer_unique_id) AS Total_customers,
		COUNT(DISTINCT fp.Customer_unique_id) AS Returning_customers
FROM Customers c
		LEFT JOIN FirstPurchase fp ON c.customer_unique_id = fp.Customer_unique_id;