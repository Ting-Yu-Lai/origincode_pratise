/* Q1. 找出今日下單的使用者 email

tables: users, orders

users(id, name, email)
orders(id, user_id, created_at)


今天日期 = NOW() */

SELECT u.name, u.email FROM users u JOIN orders o ON u.id = o.user_id WHERE created_at = NOW();

-- 訂正:
SELECT u.name, u.email FROM users u JOIN orders o ON u.id = o.user_id WHERE DATE(created_at) = CURDATE();

/* Q2. 查詢商品銷售數量（含銷售 0 的）
這邊要注意有含銷售0，所以會是LEFT JOIN

table: products, order_items

products(id, name)
order_items(id, product_id, qty) */

SELECT p.name, SUM(o.qty) AS total_qty FROM products p JOIN order_items o ON p.id = o.product_id GROUP BY p.name;
SELECT p.name, SUM(o.qty) AS total_qty FROM products p LEFT JOIN order_items o ON p.id = o.product_id GROUP BY p.name;

-- Q3. 找出訂單數量最多的前 3 位使用者

SELECT u.id, u.name, COUNT(o.id) AS order_count
FROM users u 
JOIN  orders o ON u.id = o.user_id
GROUP BY u.id, u.name
ORDER BY order_count DESC
LIMIT 3;

-- Q4. update：把狀態 pending → completed

UPDATE `table` SET status = "completed" WHERE status = "pending";

-- Q5. 防止 DELETE 誤刪寫法（兩種答法）

先select確認 並且一定要加上id;

--訂正:
1. 先查再刪
2. LIMIT + ORDER

