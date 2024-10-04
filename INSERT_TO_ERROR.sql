# 在 products_error 表中插入對應的資料
# 模板 ('product_code', '情況 : ......', '原因 : ......', '排除 : ........');
USE product_test;
INSERT INTO
	products_error (
		product_code,
        failure_condition,
        failure_reason,
        troubleshooting
	)
VALUES

	('CODE123', '情況 : 聲音變很小', '原因 : 喇叭故障', '排除 : 送修');