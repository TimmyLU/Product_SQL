#SHOW DATABASES;									 # 列出 當前的DATABASES
#SHOW TABLES;										 # 列出 當前的TABLES
#CREATE DATABASE product_test;						 # 創一個資料庫名為 DATABASE
#SET SQL_SAFE_UPDATES = 0;							 # 關閉安全設置
#SET SQL_SAFE_UPDATES = 1;							 # 開啟安全設置
USE product_test;
#select * from products;
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

CREATE TABLE products_error (
    id INT AUTO_INCREMENT PRIMARY KEY,               # ID (唯一 & 不可重複)
    product_code VARCHAR(100) NOT NULL,              # 商品代碼 (對應 products)
    failure_condition TEXT,                          # 故障情況
    failure_reason TEXT,							 # 故障原因
	troubleshooting TEXT,							 # 故障排除
    FOREIGN KEY
		(product_code)
    REFERENCES
		products(product_code)				 		 # 設置外鍵 (product_code 對應 products表)
);