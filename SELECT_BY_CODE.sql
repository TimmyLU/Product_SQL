# 列出特定商品的紀錄包含故障
USE product_test;
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
    products as p
LEFT JOIN 
    products_error pd ON p.product_code = pd.product_code
WHERE 
    p.product_code = 'CODE121';
    #p.purchase_company = '公司X';