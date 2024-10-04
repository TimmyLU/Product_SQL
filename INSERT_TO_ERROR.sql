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
	('CODE130', '情況 : 麥克風沒有聲音', '原因 : HUB故障', '排除 : 更換新HUB');