-- 9. Geographical regions with highest AOV

SELECT
		c.customer_city AS Customer_city,
		c.customer_state AS Customer_state,
		SUM(op.payment_value) / COUNT(DISTINCT o.order_id) AS AOV
FROM Orders o
		INNER JOIN Order_payments op ON o.order_id = op.order_id
		INNER JOIN Customers c ON c.customer_id = o.customer_id
GROUP BY c.customer_city, c.customer_state
ORDER BY AOV DESC;