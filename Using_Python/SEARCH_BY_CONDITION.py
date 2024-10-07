import mysql.connector

conn = mysql.connector.connect(
    host = '127.0.0.1',
    user = 'root',
    password = '1234',
    database = 'product_test'
)

cursor = conn.cursor()
cursor.execute("USE product_test")

product_name = input("請輸入產品名稱: ")
failure_condition = "%" + input("請輸入故障條件: ") + "%"

#print(f"輸入的產品名稱: {product_name}")
#print(f"輸入的故障條件: {failure_condition}")

query = """
SELECT 
    p.product_name,
    p.product_code,
    pd.failure_condition,
    pd.failure_reason,
    pd.troubleshooting
FROM 
    products AS p
JOIN 
    products_error pd ON p.product_code = pd.product_code
WHERE 
    p.product_name = %s AND 
    pd.failure_condition LIKE %s;
"""

cursor.execute(query, (product_name, failure_condition))

results = cursor.fetchall()

if not results:
    print("沒有找到符合條件的資料。")
else:
    for row in results:
        print(row)

cursor.close()
conn.close()
