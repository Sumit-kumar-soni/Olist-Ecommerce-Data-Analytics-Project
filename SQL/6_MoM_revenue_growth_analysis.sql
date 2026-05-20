-- 6. MoM revenue growth for top 5 categories
-- Insight: The top 5 categories with the highest revenue growth are: Health Beauty, Watches Gifts, Bed Bath Table, Sports Leisure and Computers Accessories.

WITH Top_categories AS
(	SELECT	TOP 5
			pc.product_category_name_english AS Product_categories,
			SUM(oi.price) AS Total_revenue
	FROM Orders o
			INNER JOIN Order_items oi ON oi.order_id = o.order_id
			INNER JOIN Products p ON oi.product_id = p.product_id
			INNER JOIN product_category_name_translation pc on p.product_category_name = pc.product_category_name
	GROUP BY pc.product_category_name_english
	ORDER BY Total_revenue DESC
)
,
Category_revenue AS(
	SELECT 
			pc.product_category_name_english AS Product_categories,
			MONTH(o.order_purchase_timestamp) AS Order_month,
			SUM(oi.price) AS Monthly_revenue
	FROM Orders o
			INNER JOIN Order_items oi ON o.order_id = oi.order_id
			INNER JOIN Products p ON oi.product_id = p.product_id
			INNER JOIN product_category_name_translation pc ON p.product_category_name = pc.product_category_name
	WHERE pc.product_category_name_english IN(
												SELECT Product_categories
												FROM Top_categories
	)
	GROUP BY pc.product_category_name_english, MONTH(o.order_purchase_timestamp)
)


SELECT
		Product_categories,
		Order_month,
		Monthly_revenue,
		LAG(Monthly_revenue) OVER(PARTITION BY Product_categories ORDER BY Order_month) AS Previous_monthly_revenue
FROM Category_revenue