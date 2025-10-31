-- Q1. 找出 age > 25 的使用者名字與 email
-- users (id, name, email, age)

SELECT * FROM `users` WHERE `age` > 25;

-- 訂正:題目要求 name,email
-- 所以其實我只需要選擇name email 欄位就好
SELECT `name`, `email` FROM `users` WHERE `age` > 25

-- Q2. 找出每位使用者的訂單總金額
-- 資料表：
-- users (id, name)
-- orders (id, user_id, amount)

-- 結果欄位：name, total_amount

SELECT * FROM `users` INNER JOIN `orders` ON `users`.`id` = `orders`.`id`

-- 訂正:
-- 1. orders.user_id 不是 orders.id
-- 2. 有total_amount 所以應該是 SUM(amount)
-- 3. 需要 GROUND BY

SELECT `users.name`, SUM(`amount`) AS `total_amount`
FROM `users.id`
INNER JOIN `orders.user_id` ON `users.id` = `orders.id`
GROUP BY `users.id`

-- Q3. 找出總訂單金額 > 1000 的使用者
-- 接續 Q2 資料表

HAVING `amout > 1000`;

-- 訂正:

SELECT `users.name`, SUM(`amount`) AS `total_amount`
FROM `users.id`
INNER JOIN `orders.user_id` ON `users.id` = `orders.id`
GROUP BY `users.id`
HAVING total_amount > 1000;

-- Q4. 找出過去 7 天內新增的會員（created_at 欄位）

SELECT * FROM `users` WHERE `created_at` DAY-7;

訂正:
1.日期語法錯誤

SELECT * FROM `users` WHERE created_at >= DATE_SUB(NOW(), INTERVAL 7 DAY);

-- Q5. 寫出新增一筆使用者資料的
-- users (id, name, email, age)

INSERT INTO `users` (`email`,`name`,`age`) VALUES ('amy@gmail.com','amy','21');

-- Q6. 解釋 JOIN vs LEFT JOIN 差異

JOIN -> 找出共有的資料表內容
LEFT JOIN -> 結合另一張表沒有的內容，最後還是會留下固有的內容

-- 建議回答
-- JOIN 只取兩表都有的資料
-- LEFT JOIN 會保留左表全部，即使右表沒有對應資料

-- Q7. 加上 index 的目的是什麼？缺點？

index 可以快速查詢，缺點就是占空間，會減少inset的時間

-- Q8. 防 SQL Injection 的方式（PHP答法）
$stmt = $pdo->prepare("SELECT * FROM users WHERE email = :email");
$stmt->execute(['email' => $email]);

-- Q9. 目前有一張 table product, 欄位 id, name, price
DELETE FROM `product` WHERE `price` < 10;

-- Q10. 找出 email domain 是 gmail.com 的使用者

SELECT * FROM `users` WHERE `email` LIKE "%@gmail.com";

