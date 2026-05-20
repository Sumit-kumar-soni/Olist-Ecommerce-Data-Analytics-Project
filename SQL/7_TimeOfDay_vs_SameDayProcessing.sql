-- 7. Time of day vs. same-day processing

SELECT
		DATEPART(HOUR, order_purchase_timestamp) AS Order_hour,
		SUM(CASE WHEN CAST(order_purchase_timestamp AS DATE) = CAST(order_approved_at AS DATE) THEN 1 ELSE 0 END) AS Same_day_processed,
		COUNT(*) AS Total_orders
FROM Orders
GROUP BY DATEPART(HOUR, order_purchase_timestamp)