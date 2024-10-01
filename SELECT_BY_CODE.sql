SELECT 
    p.product_name,
    p.purchase_company,
    p.purchase_date,
    p.warranty_period,
    p.description AS product_description,
    pd.failure_condition,
    pd.failure_reason,
    pd.troubleshooting
FROM 
    products p
LEFT JOIN 
    products_error pd ON p.product_code = pd.product_code
WHERE 
    p.product_code = 'CODE115';
    #p.purchase_company = '公司X';