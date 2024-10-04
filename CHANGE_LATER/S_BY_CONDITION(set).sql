SET @product_name = '產品F';
SET @failure_condition = '%會議%';

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
    pd.failure_condition LIKE @failure_condition;