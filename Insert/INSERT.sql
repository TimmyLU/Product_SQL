# 在 products 表中插入資料
# 模板 ('產品', '公司', 'CODE111', '2024-09-24 14:30:35', '保固幾個月', '購買備註');
USE product_test;
INSERT INTO
	products (
		product_name,
        purchase_company,
        product_code,
        purchase_date,
        warranty_period,
        description
	)
VALUES
	('產品A', '公司ll', 'CODE129', '2010-10-10 10:36:11', '12', '過保測試');
    
    
