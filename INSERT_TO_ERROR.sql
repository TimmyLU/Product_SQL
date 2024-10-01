# 在 products_error 表中插入對應的資料
# 模板 ('product_code', '情況 : ......', '原因 : ......', '排除 : ........');
INSERT INTO
	products_error (
		product_code,
        failure_condition,
        failure_reason,
        troubleshooting
	)
VALUES
	('CODE117', '情況 : 麥克風沒有聲音', '原因 : HUB故障', '排除 : 更換新HUB'),
    ('CODE118', '情況 : 影像輸出斷斷續續', '原因 : 延伸器故障', '排除 : 更換延伸器'),
    ('CODE119', '情況 : lifesize畫面異常', '原因 : 長時間開機', '排除 : 重新開機'),
    ('CODE120', '情況 : 遠端看不到畫面', '原因 : 視訊鏡頭故障', '排除 : 送修');
    