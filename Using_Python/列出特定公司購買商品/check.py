import mysql.connector

conn = mysql.connector.connect(
    host = '127.0.0.1',
    user = 'root',
    password = '1234',
    database = 'product_test'
)

cursor = conn.cursor()

print("----------依照公司名稱列出購買商品及是否過保----------")

while True:
    purchase_company = "%" + input("請輸入公司名稱(輸入 'exit'退出): ") + "%"
    if purchase_company.lower() == '%exit%':
        print("已退出")
        break
    query = """
    SELECT
        purchase_company,
        product_name,
        product_code,
        purchase_date,
        warranty_period,
        CASE
            WHEN DATE_ADD(purchase_date, INTERVAL warranty_period MONTH) < NOW()
            THEN '商品已過保'
            ELSE '商品未過保'
        END AS warranty_status
    FROM
        products
    WHERE
        purchase_company LIKE %s;
    """
    cursor.execute(query,(purchase_company,))
    results = cursor.fetchall()

    if not results:
        print("沒有找到符合條件的資料。")
    else:
        count = 1
        for row in results:
            print('-' * 40)
            print("公司名稱:", row[0])
            print("產品名稱:", row[1])
            print("產品代碼:", row[2])
            print("購買日期:", row[3])
            print("保固時長:", row[4])
            print("保固情況:", row[5])
            print('-' * 40)

cursor.close()
conn.close()
