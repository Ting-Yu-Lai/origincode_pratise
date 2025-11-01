/* 
Q1.

資料表：users (id, name, email, age)
將 id = 5 的使用者年齡改成 30 
*/

UPDATE users
SET age = 30
WHERE id = 5;

/* 
Q2.

資料表：products (id, name, price)
把所有價格小於 100 的商品價格調高 20 元
*/

UPDATE products
SET price = 20
WHERE price < 100;

-- 訂正: 我的寫法是「設定」20 題目是要「調高」20

UPDATE products
SET price = price + 20
WHERE price < 100;

/* 
Q3.

資料表：orders (id, user_id, status)
將所有 status = 'pending' 的訂單改成 completed
*/

UPDATE orders
SET `status` = completed
WHERE `status` = "pending";

-- 訂正: completed是字串要注意引號

UPDATE orders
SET `status` = "completed"
WHERE `status` = "pending";

/* Q4.

資料表：

users(id, status)
payments(id, user_id, paid)

如果 payments.paid = 1 → 更新對應使用者的 users.status = 'active'

寫出更新語法：

（提示：UPDATE JOIN
*/

UPDATE users
JOIN payments ON payments.user_id = users.id
SET `status` = 'active' 
WHERE payments.PAID = 1;

UPDATE users
JOIN payments ON payments.user_id = users.id
SET users.status = 'active'
WHERE payments.paid = 1;

/* 
✅ 安全性題目（陷阱）
Q5.

為什麼寫 UPDATE 需要加 WHERE？
漏寫會怎樣？（面試官愛問）
*/

如果沒有增加WHERE很容易會變成修改整筆資料庫統一欄位

精準回復:
    因為沒有 WHERE，資料表中的所有資料都會被更新，造成資料毀損。
漏寫造成:
    1.  整張表都被改
    2.  無法輕易復原（除非你開 transaction 或備份
補充版答案:
    UPDATE 是破壞性操作，漏寫 WHERE 會更新全部資料，導致資料錯誤或損毀，因此務必先 SELECT 確認再 UPDATE。