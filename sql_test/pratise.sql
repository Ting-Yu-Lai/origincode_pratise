-- P1.

-- 找出每位使用者的「訂單數」與「總金額」
-- 條件：總金額 > 500
-- 顯示：name, order_count, total_amount

-- 資料表

-- user(id,name), orders(id,user_id,amount)

SELECT `user.name`, SUM(`user_id`) AS order_count, SUM(`amount`) AS total_amount
FROM `user.id`
INNER JOIN `orders.user_id` ON 
WHERE total_amount > 500;

-- 訂正:
-- 會運用到 GROUP BY 因為 "每位使用者"

-- COUNT(orders.id) 為什麼不是 SUM(user_id)
-- COUNT() 是算筆數
-- SUM(user_id) 沒意義，它是在加 id

-- 為什麼 HAVING？

-- 因為 SUM() 是聚合函數 → 不能用 WHERE

-- 為什麼 JOIN 條件寫 u.id = o.user_id？

-- 用 user 的 id 去對訂單的 user_id
SELECT `user.name`
       COUNT(user_id) AS order_count
       SUM(amount) AS total_amount
FROM `user` 
JOIN `orders` ON `user.id` = `order.user_id`
GROUP BY `user.id`
HAVING total_amount > 500;

-- P2.

-- 請找出每個商品的銷售總額（price * quantity 加總）
-- 並且只顯示總額 > 1000 的商品

-- 資料表

-- products(id, name, price, category_id)
-- categories(id, category_name)
-- orders(id, product_id, quantity) 




