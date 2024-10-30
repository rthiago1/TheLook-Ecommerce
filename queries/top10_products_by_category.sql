

WITH base_table AS (
	SELECT
		p.category,
		p.name,
		SUM(oi.sale_price) AS total_sold,
		ROW_NUMBER() OVER(PARTITION BY category ORDER BY SUM(oi.sale_price) DESC) AS prod_rank -- ranking products by revenue generated in descending order and grouping by category
	FROM products p
	LEFT JOIN order_items oi
	ON oi.product_id = p.id
	WHERE oi.status = 'Complete'
	GROUP BY
		p.category,
		p.name
)
SELECT
	category,
	name,
	CAST(total_sold AS FLOAT) AS total_sold
FROM base_table
WHERE prod_rank < 11 -- filtering the top 5 products that drove most revenue by category
ORDER BY 
	1	
