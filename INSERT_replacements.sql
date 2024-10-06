# 在 products 表中插入資料
# 模板 ('原商品代碼', '新商品代碼', '換貨日期', '故障原因或換貨原因');
INSERT INTO
	product_replacements(
		original_product_code,
		new_product_code,
		replacement_date,
		reason
	)
VALUES
	('A123', 'B456', '2024-10-06', '故障原因');


    
