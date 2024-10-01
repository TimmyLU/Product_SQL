# 在 products_error 表中插入對應的資料
# 模板 ('product_code', '情況 : ......', '原因 : ......', '排除 : ........');
INSERT INTO
	products_error (product_code, failure_condition, failure_reason, troubleshooting)
VALUES
	('CODE113', '情況 : 沒有輸出', '原因 : HDMI線接觸不良', '排除 : 更換新HDMI'),
    ('CODE114', '情況 : LED異常', '原因 : LED故障', '排除 : 更換機器'),
    ('CODE115', '情況 : TEAMS打不開', '原因 : 韌體過時', '排除 : 更新韌體'),
    ('CODE116', '情況 : 會議中沒有聲音', '原因 : 機器選項設定錯誤', '排除 : 更變設定');
    