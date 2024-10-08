# 在error表中找出某商品含有特定關鍵字的故障紀錄
# 更新用SET提高可讀性
SET @product_name = '產品F';
SET @failure_condition1 = '%會議%';
#SET @failure_condition2 = '%音量%';

SELECT 
    p.product_name,
    p.product_code,
    pd.failure_condition,
    pd.failure_reason,
    pd.troubleshooting
FROM 
    products AS p
JOIN 
    products_error pd ON p.product_code = pd.product_code
WHERE 
    p.product_name = @product_name AND 
    pd.failure_condition LIKE @failure_condition1;
    #(pd.failure_condition LIKE @failure_condition1
	#	OR pd.failure_condition LIKE @failure_condition2);
