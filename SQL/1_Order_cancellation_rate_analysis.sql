-- 1. Order cancellation rate by product category
-- My insight is that people are canceling their electonic products because of change in technology day by day.

SELECT 
		p.product_category_name, 
		COUNT(o.order_id) AS Total_orders,
		SUM(CASE WHEN o.order_status = 'Canceled' THEN 1 ELSE 0 END) AS Canceled_orders,
		ROUND(CAST(SUM(CASE WHEN o.order_status = 'Canceled' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(o.order_id) * 100, 2) AS Cancellation_rate
FROM orders o
		INNER JOIN order_items oi ON o.order_id = oi.order_id
		INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY Cancellation_rate DESC;