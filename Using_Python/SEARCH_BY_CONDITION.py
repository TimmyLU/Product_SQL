import mysql.connector

conn = mysql.connector.connect(
    host = '127.0.0.1',
    user = 'root',
    password = '1234',
    database = 'product_test'
)

cursor = conn.cursor()
cursor.execute("USE product_test")

print("----------輸入產品名稱及故障條件來搜尋----------")
product_name = input("請輸入產品名稱: ")
failure_condition = "%" + input("請輸入故障條件: ") + "%"

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
    count = 1
    for row in results:
        #print(row)
        print('-'*40)
        print("符合條件的第" + str(count) + "項:")
        count += 1
        print("產品名稱:",row[0])
        print("產品代碼:",row[1])
        print("故障情況:",row[2])
        print("故障原因:",row[3])
        print("故障排除:",row[4])
        print('-'*40)

cursor.close()
conn.close()
