import mysql.connector

conn = mysql.connector.connect(
    host = '127.0.0.1',
    user = 'root',
    password = '1234',
    database = 'product_test'
)

cursor = conn.cursor()

print("----------輸入產品名代碼找相關資料包含故障----------")
while True:
    product_code = input("請輸入產品代碼 (輸入 'exit' 退出): ")
    if product_code.lower() == 'exit':
        print("已退出")
        break

    query = """
    SELECT
        p.product_name,
        p.purchase_company,
        p.purchase_date,
        p.warranty_period,
        p.description AS product_description,
       pd.failure_condition,
        pd.failure_reason,
        pd.troubleshooting
    FROM
        products AS p
    LEFT JOIN
        products_error pd ON p.product_code = pd.product_code
    WHERE
        p.product_code = %s;
    """
    cursor.execute(query, (product_code,))

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
            print("產品名稱:", row[0])
            print("購買公司:", row[1])
            print("產品時間:", row[2])
            print("保固期(月):", row[3])
            print("購買備註:", row[4])
            print("故障情況:", row[5])
            print("故障原因:", row[6])
            print("故障排除:", row[7])
            print('-'*40)
            
cursor.close()
conn.close()
