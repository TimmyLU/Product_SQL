import mysql.connector

conn = mysql.connector.connect(
    host = '127.0.0.1',
    user = 'root',
    password = '1234',
    database = 'product_test'
)

cursor = conn.cursor()

print("----------輸入產品代碼確認保固期限----------")

while True:
    product_code = input("請輸入產品代碼 (輸入 'exit' 退出): ")
    if product_code.lower() == 'exit':
        print("已退出")
        break

    # TEST INPUT
    #print(f"輸入的產品代碼: {product_code}")

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
        product_code = %s;
    """

    cursor.execute(query, (product_code,))

    results = cursor.fetchall()

    if not results:
        print("沒有找到符合條件的資料。")
    else:
        for row in results:
            print("-" * 40)
            print("產品代碼:", row[0])
            print("產品名稱:", row[1])
            print("購買日期:", row[2])
            print("保固期(月):", row[3])
            print("保固到期日:", row[4])
            print("當前時間:", row[5])
            print("保固狀態:", row[6])
            print("-" * 40)

cursor.close()
conn.close()
