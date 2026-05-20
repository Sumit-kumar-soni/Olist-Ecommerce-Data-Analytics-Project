-- 2. Sellers with highest volume of delayed deliveries
-- My insight is that there are a lot of delayed orders by some sellers and there average delay is under 10 Days. I think the reason is high freight value of some states, which is why they use cheap transportation methods.
-- The solution is to create new transportation business in those areas to reduce freight costs and sellers also need to solve their logistics problems.

SELECT	TOP 10
		oi.seller_id AS Seller_id,
		COUNT(DISTINCT o.order_id) AS Delay_orders,
		AVG(DATEDIFF(DAY,o.order_estimated_delivery_date,o.order_delivered_customer_date)) AS Avg_delay_days
FROM Orders o
		INNER JOIN Order_items oi ON o.order_id = oi.order_id
WHERE o.order_delivered_customer_date > o.order_estimated_delivery_date
GROUP BY oi.seller_id
ORDER BY Delay_orders DESC;