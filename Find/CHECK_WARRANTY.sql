# 查看商品是否過保, 利用商品代碼
SELECT
    product_code,
    product_name,
    purchase_date,
    warranty_period,
    DATE_ADD(purchase_date, INTERVAL warranty_period MONTH) AS warranty_expiry_date,
    NOW() AS cur_time,
    CASE
        WHEN NOW() > DATE_ADD(purchase_date, INTERVAL warranty_period MONTH)
        THEN '商品已過保'
        ELSE '商品未過保'
    END AS warranty_status
FROM
    products
WHERE
    product_code = 'CODE129';
