# Project Background
TheLook is an eCommerce clothing site developed by the Looker team. The dataset contains information about customers, products, orders, logistics, web events and digital marketing campaigns. We will leverage SQL to answer key business questions that can inform strategies around marketing, sales, customer retention, and inventory management.

Insights and recommendations are provided on the following key areas:

- **Top-selling products by category:** Identify which products generate the most revenue within each category. Understanding top sellers helps in inventory management and targeted marketing efforts.
- **Customer Purchase Behavior over time:** Analyzing purchase trends by month, in order to discover seasonal patterns in customer purchasing behavior, enabling better forecasting and marketing strategies.
- **Average Order Value (AOV) by Segment:** Segmenting customers based on purchase history and calculating their AOV can help tailor promotions and improve customer targeting.
- **Customer Retention Rate by Marketing Channel:** By examining retention rates for customers acquired through various marketing channels, we can assess the effectiveness of marketing strategies.

The SQL queries used to inspect and clean the data for this analysis can be found here [].

Targed SQL queries regarding various business questions can be found here []

An interactive Power BI dashboard used to report and explore sales trends can be found here [link](https://app.powerbi.com/view?r=eyJrIjoiNGQ3MWVlOWUtMGYwNC00N2U2LWFkZTctOGIxYTNkYzgwODMyIiwidCI6ImRkNjZhNjhkLTM1ZGEtNGE4NS05NDJhLTRiYTg4NTI1ZGIzMiIsImMiOjh9)



# Data Structure & Initial Checks

The companies main database structure as seen below consists of seven tables: **distribution_centers**, **users**, **order_items**, **orders**, **products**, **events**, **inventory_items** with a total row count of 2.4m records.

![Entity Relationship Diagram here](https://github.com/rthiago1/TheLook-Ecommerce/blob/main/imgs/logical_model_white.jpg?raw=true)



# Executive Summary

### Overview of Findings


For 2024, we see a consistent monthly increase in sales, with a notable peak in October at $210,002. However, we also observe a high return rate of 40.88%, which raises concerns about potential product quality issues or mismatches in customer expectations. Regarding top brand sales, Ray-Ban generates the highest margin rate, accounting for approximately 50% of the total revenue from our leading brand.

![dash](https://github.com/rthiago1/TheLook-Ecommerce/blob/main/imgs/exec_tab_dash.jpg?raw=true)

