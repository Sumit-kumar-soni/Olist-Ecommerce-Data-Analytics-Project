-- 3. Delivery delay vs. average review score
-- Lower average scores have higher delivery delays.

SELECT
		DATEDIFF(DAY, o.order_delivered_customer_date, o.order_estimated_delivery_date) as Delay_delivery_days,
		AVG(r.review_score) AS Avg_score
FROM Orders o
		INNER JOIN Order_reviews r ON o.order_id = r.order_id
WHERE order_delivered_customer_date > order_estimated_delivery_date
GROUP BY DATEDIFF(DAY, o.order_delivered_customer_date, o.order_estimated_delivery_date)
ORDER BY Delay_delivery_days;