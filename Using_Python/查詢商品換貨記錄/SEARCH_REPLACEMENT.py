import mysql.connector

conn = mysql.connector.connect(
    host = '127.0.0.1',
    user = 'root',
    password = '1234',
    database = 'product_test'
)

cursor = conn.cursor()

print("----------輸入原本代碼找尋換貨記錄----------")

while True:
    original_product_code = input("請輸入產品代碼 (輸入 'exit' 退出):")
    if original_product_code.lower() == 'exit':
        print("已退出")
        break
    query = """
    SELECT
        new_product_code,
        replacement_date,
        reason
    FROM
        products_replacements
    WHERE
        original_product_code = %s
    """

    cursor.execute(query, (original_product_code,))
    results = cursor.fetchall()

    if not results:
        print("沒有找到符合條件的資料。")
    else:
        for row in results:
            print('-' * 40)
            print("換貨商品代碼:",row[0])
            print("換貨時間:",row[1])
            print("換貨理由:",row[2])
            print('-' * 40)

cursor.close()
conn.close()
