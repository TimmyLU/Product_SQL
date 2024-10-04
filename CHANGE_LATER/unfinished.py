import mysql.connector

conn = mysql.connector.connect(
    host = '127.0.0.1',
    user = 'root',
    password = '1234',
    database = 'product_test'
)

cursor = conn.cursor()
cursor.execute("USE product_test")

product_code = input("請輸入產品代碼: ")
#
#

query = """
SELECT
    product_code,
    product_name,
    purchase_date,
    warranty_period,
    DATE_ADD(purchase_date, INTERVAL warranty_period MONTH) AS warranty_expiry_date,
    NOW() AS cur_time,
    CASE
        WHEN NOW() > DATE_ADD(purchase_date, INTERVAL warranty_period MONTH)
        THEN '商品已過保'
        ELSE '商品未過保'
    END AS warranty_status
FROM
    products
WHERE
    product_code = '%s';
"""
cursor.execute(query, (product_code))

results = cursor.fetchall()

if not results:
    print("沒有找到此代碼的產品")
else:
    for row in results:
        print(row)

cursor.close()
conn.close()
