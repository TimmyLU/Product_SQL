import mysql.connector

conn = mysql.connector.connect(
    host = '127.0.0.1',
    user = 'root',
    password = '1234',
    database = 'product_test'
)

cursor = conn.cursor()

print("----------紀錄故障事件，商品代碼需存在products表中----------")

while True:
    product_code = input("請輸入商品代碼: ")
    failure_condition = input("請輸入故障情況: ")
    failure_reason = input("請輸入故障原因: ")
    troubleshooting = input("請輸入故障排除: ")

    query = """
    INSERT INTO
        products_error(
            product_code,
            failure_condition,
            failure_reason,
            troubleshooting
        )

    VALUES
        (%s, %s, %s, %s)
    """
    try:
        cursor.execute(query, (product_code, failure_condition, failure_reason, troubleshooting))
        conn.commit()
        print('-' * 50)
        print("插入成功，以插入的產品代碼:", product_code)
    except mysql.connector.Error as e:
        print(f"插入失敗: {e}")
    check = input("輸入 'exit' 退出: ")
    if(check.lower() == 'exit'):
        print("已退出")
        break
    else:
        pass
cursor.close()
conn.close()
