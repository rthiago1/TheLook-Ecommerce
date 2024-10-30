
-- Conversion Rate by browser and traffic source
WITH base_table AS (
	SELECT DISTINCT 
		browser,
		traffic_source,
		session_id,
		event_type
	FROM events
), funnel_table AS (
	SELECT
		browser,
		traffic_source,
		session_id,
		CASE WHEN event_type = 'home' THEN 1 ELSE 0 END AS home_page,
		CASE WHEN event_type = 'department' THEN 1 ELSE 0 END AS department_page,
		CASE WHEN event_type = 'product' THEN 1 ELSE 0 END AS product_page,
		CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END AS cart_page,
		CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END AS purchase_page
	FROM base_table
), final_table AS (
	SELECT
		browser,
		traffic_source,
		COUNT(DISTINCT [session_id]) AS session_volume,
		SUM(home_page) AS home_page,
		SUM(department_page) AS department_page,
		SUM(product_page) AS product_page,
		SUM(cart_page) AS cart_page,
		SUM(purchase_page) AS purchase_page
	FROM funnel_table
	GROUP BY 
		browser,
		traffic_source
)
SELECT
	browser,
	traffic_source,
	ROUND(1.0 * purchase_page / session_volume ,5) AS cvr
FROM final_table