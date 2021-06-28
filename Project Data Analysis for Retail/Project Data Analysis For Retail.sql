
# Overall Performance by Year
=============================
SELECT YEAR(order_date) as years,
	   SUM(sales) as sales,
	   COUNT(order_quantity) as number_of_order
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY years;

# Overall Performance by Product Sub Category
=============================================
SELECT 
	YEAR(order_date) AS years,
	product_sub_category,
	SUM(sales) AS sales
FROM 
	dqlab_sales_store
WHERE
	YEAR(order_date) BETWEEN 2011 AND 2012
	AND order_status LIKE 'Order Finished'
GROUP BY
	years, product_sub_category
ORDER BY
	years, sales DESC;

# Promotion Effectiveness and Efficiency by Years
=================================================
SELECT 
        year(order_date) as years, 
		sum(sales) as sales, 
		sum(discount_value) as promotion_value, 
		round(sum(discount_value)/sum(sales)*100,2) as burn_rate_percentage
FROM dqlab_sales_store
WHERE year(order_date) BETWEEN 2009 AND 2012 AND order_status = 'Order Finished'
GROUP BY year(order_date)
ORDER BY years ASC;

# Promotion Effectiveness and Efficiency by Product Sub Category
================================================================
SELECT 
        year(order_date) as years, 
		product_sub_category,
		product_category,
		sum(sales) as sales, 
		sum(discount_value) as promotion_value, 
		round(sum(discount_value)*100/sum(sales),2) as burn_rate_percentage
FROM dqlab_sales_store
WHERE year(order_date) = 2012 AND order_status = 'Order Finished'
GROUP BY years, product_sub_category, product_category
ORDER BY sales DESC;

# Customers Transactions per Year
================================
SELECT 
	year(order_date) as years,
	count(distinct customer) as number_of_customer
FROM dqlab_sales_store
WHERE year(order_date) BETWEEN 2009 AND 2012 AND order_status='Order Finished'
GROUP BY years;
