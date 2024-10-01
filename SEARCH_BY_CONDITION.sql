SELECT 
    p.product_name,
    pd.failure_condition,
    pd.failure_reason,
    pd.troubleshooting
FROM 
    products as p
JOIN 
    products_error pd ON p.product_code = pd.product_code
WHERE 
    p.product_name = '產品F' AND 
    pd.failure_condition LIKE '%會議%';