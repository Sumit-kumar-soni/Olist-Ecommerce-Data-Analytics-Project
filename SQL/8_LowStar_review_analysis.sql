-- 8. 1-star reviews: delivery vs. product quality

SELECT 
    SUM(CASE WHEN review_comment_message LIKE '%entrega%' OR review_comment_message LIKE '%atrasado%' OR review_comment_message LIKE '%atrasada%'
	OR review_comment_title LIKE '%entrega%' OR review_comment_title LIKE '%atrasado%' OR review_comment_title LIKE '%atrasada%'
	THEN 1 ELSE 0 END) AS Delivery_issues,
    
	SUM(CASE WHEN review_comment_message LIKE '%qualidade%' OR review_comment_message LIKE '%quebrado%' OR review_comment_message LIKE '%quebrada%'
	OR review_comment_title LIKE '%qualidade%' OR review_comment_title LIKE '%quebrado%' OR review_comment_title LIKE '%quebrada%'
	THEN 1 ELSE 0 END) AS Quality_issues

FROM order_reviews
WHERE review_score = 1;