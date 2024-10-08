import mysql.connector

conn = mysql.connector.connect(
    host = '127.0.0.1',
    user = 'root',
    password = '1234',
    database = 'product_test'
)

cursor = conn.cursor()

print("----------插入資料到products table當中----------")

while True:
    product_name = input("請輸入產品名稱: ")
    purchase_company = input("請輸入購買公司名稱: ")
    product_code = input("請輸入產品代碼: ")
    purchase_date = input("請輸入購買日期 (YYYY-MM-DD HH:MM:SS): ")
    warranty_period = input("請輸入保固時長 (以月為單位): ")
    description = input("請輸入商品描述: ")

    query = """
    INSERT INTO products (
        product_name,
        purchase_company,
        product_code,
        purchase_date,
        warranty_period,
        description
    )
    VALUES (%s, %s, %s, %s, %s, %s)
    """
    try:
        cursor.execute(query, (product_name, purchase_company, product_code, purchase_date, warranty_period, description))
        conn.commit()
        print('-' * 50)
        print("插入成功，已插入的產品代碼:", product_code)
    except mysql.connector.Error as e:
        print(f"插入失敗: {e}")
    
    check = input("輸入 'exit' 退出: ")
    if check.lower() == 'exit':
        print("已退出")
        break
    else:
        pass
cursor.close()
conn.close()
