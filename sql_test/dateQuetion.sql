/* ✅ Q1. 查詢今天註冊的會員

table: users(id, name, email, created_at)

找出 created_at 為今天的使用者 name, email */

SELECT name, email FROM users  WHERE DATE(created_at) = CURDATE();

/* Q2. 查詢過去 7 天內有下訂單的會員

table: orders(id, user_id, created_at)

發生在最近 7 天內的訂單 — 抓 user_id 去重 */

SELECT u.id, u.name FROM users u
JOIN orders o ON u.id = o.user_id
WHERE created_at >= DATE_SUB(NOW(), INTERVAL 7 DAY);
-- WHERE created_at >= DATE_SUB(NOW(), INTERVAL 7 DAY);

DISTINCT -- 自行回答應該放在哪裡

/* Q3. 統計 2024 每個月份的訂單數

table: orders(id, created_at)

請輸出：月份、訂單筆數
Hint: 使用 YEAR(), MONTH(), GROUP BY */
SELECT COUNT(MONTH(created_at)) as order_month_total
FROM orders
WHERE DATE(YEAR(created_at) = 2024);

SELECT 
    MONTH(created_at) AS month, -- 取出
    COUNT(*) AS order_count
FROM orders
WHERE YEAR(created_at) = 2024
GROUP BY MONTH(created_at)
ORDER BY month;

/* Q4. 查詢每位會員最後一次下單日期

table: users, orders

顯示 user.name 與 最後下單時間 (最大 created_at)
就算沒訂過單也要顯示會員（用 LEFT JOIN） */

SELECT u.name, o.created_at
FROM users u 
LEFT JOIN orders o ON u.id = o.user_id
ORDER BY created_at DESC
LIMIT 1;

select u.name,
        MAX(o.created_at) AS last_order
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name;

/* Q5. 刪除 30 天以前的 log

table: logs(id, created_at)

把 created_at 早於現在 30 天前的資料刪掉（DELETE） */

DELETE FROM logs WHERE created_at < DATE_SUB(NOW(), INTERVAL 30 DAY);