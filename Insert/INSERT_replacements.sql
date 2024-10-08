# 在 products 表中插入資料
# 模板 ('原商品代碼', '新商品代碼', '換貨日期', '故障原因或換貨原因');
INSERT INTO
	products_replacements(
		original_product_code,
		new_product_code,
		replacement_date,
		reason
	)
VALUES
	('CODE130', 'CODE131', '2024-01-11', '換貨測試 換貨測試 123 abc');


    
