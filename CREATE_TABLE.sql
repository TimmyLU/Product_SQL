#SHOW DATABASES;									 # 列出 當前的DATABASES
#SHOW TABLES;										 # 列出 當前的TABLES
#CREATE DATABASE product_test;						 # 創一個資料庫名為 DATABASE
#SET SQL_SAFE_UPDATES = 0;							 # 關閉安全設置
#SET SQL_SAFE_UPDATES = 1;							 # 開啟安全設置
USE product_test;

# 主TABLE 記錄商品出售, 且確保商品代碼唯一
/*
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,				 # ID		(唯一 & 不可重複)
    product_name VARCHAR(255) NOT NULL,              # 商品名稱 (商品名稱)
    purchase_company VARCHAR(255) NOT NULL,          # 購買公司 (公司名稱)
    product_code VARCHAR(100) NOT NULL UNIQUE,       # 商品代碼 (應該不可重複)
    purchase_date DATETIME NOT NULL,                 # 售出日期 (YYYY-MM-DD HH-MM-SS)
    warranty_period INT NOT NULL,                    # 保固時長 (單位為月)
    description TEXT,			                     # 商品備註
    UNIQUE (product_code)							 # 確保唯一
);
*/
# 副TABLE, 用於紀錄故障商品情況, 商品代碼需出現在主TABLE中才能寫入, 此表中商品代碼可重複出現
/*
CREATE TABLE products_error (
    id INT AUTO_INCREMENT PRIMARY KEY,               # ID (唯一 & 不可重複)
    product_code VARCHAR(100) NOT NULL,              # 商品代碼 (對應 products)
    failure_condition TEXT,                          # 故障情況
    failure_reason TEXT,							 # 故障原因
	troubleshooting TEXT,							 # 故障排除
    event_start_time DATETIME DEFAULT now(),		 # 事件起始時間 (自動設置為當前時間)
    event_end_time DATETIME,						 # 事件完成時間 (需手動添加)
    FOREIGN KEY
		(product_code)
    REFERENCES
		products(product_code)				 		 # 設置外鍵 (product_code對應products表, 可重複)
);
*/
# 用於紀錄換貨商品的原本代碼跟新代碼以及原因，兩個代碼需出現在products中才能寫入
/*
CREATE TABLE product_replacements (
    id INT AUTO_INCREMENT PRIMARY KEY,               # 唯一ID
    original_product_code VARCHAR(100) NOT NULL,     # 原商品代碼
    new_product_code VARCHAR(100) NOT NULL,          # 新商品代碼
    replacement_date DATETIME NOT NULL,              # 換貨日期 (必須手動指定)
    reason TEXT,                                     # 換貨原因
    FOREIGN KEY (original_product_code) REFERENCES products(product_code),
    FOREIGN KEY (new_product_code) REFERENCES products(product_code)
);
*/
