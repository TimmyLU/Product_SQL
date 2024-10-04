USE product_test;
select * from products;										# 全部列出
#SELECT * FROM products_error;
/*
select product form products
WHERE product_name = '商品A'								# 一般查找
WHERE product_name = '商品A' AND warranty_period = 12;		# AND查找
WHERE product_name = '商品A' OR warranty_period = 24;		# OR查找
WHERE description LIKE '%test%';							# 關鍵字查找


SELECT
	failure_condition, failure_reason, troubleshooting FROM products_error
WHERE
	product_code = 'CODE111';
*/