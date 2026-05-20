-- 4. Average freight value by state and purchasing volume
-- Their largest audience lives in SP and has the lowest average freight value. If you see at the bottom of the outputs, states with the lowest purchasing volume have exctremely high average freight values.

SELECT
		c.customer_state AS Customer_state,
		ROUND(AVG(freight_value), 2) AS Avg_freight,
		COUNT(DISTINCT o.order_id) AS Total_orders,
		SUM(oi.price) AS Total_revenue
FROM Orders o
		INNER JOIN Order_items oi ON o.order_id = oi.order_id
		INNER JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY Total_orders DESC;