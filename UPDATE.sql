#USE product_test;
#drop table product_replacements
# 依照id更新故障原因和排除方式, 且自動新增完成時間
/*
UPDATE
	products_error
SET 
    failure_reason = '故障原因',
    troubleshooting = '故障排除步驟',
    event_end_time = NOW()
WHERE 
    id = '';
*/
# 依照商品代碼更新備註
/*
UPDATE
	products
SET
	description = ''
WHERE
	product_code = '';
*/