/* Q1. UPDATE + 多條件

資料表：users (id, name, age, city)

將 city = 'Taipei' 且 age < 25 的使用者年齡 + 1 */

UPDATE users
SET age = age + 1
WHERE city = 'Taipei' AND age < 25;

/* Q2. UPDATE + 子查詢

資料表：
products (id, name, price, category_id)
categories (id, name)

把 category = 'Coffee' 的所有商品 +10 元 */

UPDATE products 
SET price += 10
JOIN categories c ON c.id = products.category_id
WHERE category = 'Coffee';
-- ❌ SET price += 10 MySQL 沒有 +=
-- ❌ JOIN 放錯位置 (UPDATE JOIN 語法順序錯了)

UPDATE products p 
JOIN categories c ON c.ic = p.category_id
SET p.price = p.price + 10
WHERE category = "Coffee"; 

/* Q3. UPDATE + JOIN + 計算

資料表：
employees (id, name, salary, dept_id)
departments (id, name) 
把 Engineering 部門的員工薪水調高 5% */

UPDATE employees 
SET salary = salary * (1.05)
JOIN departments d ON d.id = employees.dept_id
WHERE d.name = "Engineering";

-- 訂正
UPDATE employees e
JOIN departments d ON d.id = e.dept_id
SET e.salary = e.salary * 1.05
WHERE d.name = "Engineering"; 

/* Q4. UPDATE + CASE (條件更新)

資料表：orders (id, price, status)

如果 price > 500 → status = 'VIP'
如果 price between 100 and 500 → status = 'Normal'
其他 → status = 'Basic' */

UPDATE CASE `orders`
            WHEN price >= 500 THEN `status` = 'VIP',
            WHEN price BETWEEN 100 AND 500 THEN `status` = 'Normal',
            ELSE `status` = 'Basic'
        END

-- 訂正

UPDATE orders
SET `status` = CASE
        WHEN price >= 500 THEN "VIP",
        WHEN price BETWEEN 100 AND 500 THEN "Normal",
        ELSE 'Basic'
    END;


/* Q5. UPDATE + LIMIT（安全模式）

資料表：logs (id, action, created_at)

只刪除最舊的 3 筆 logs（把 action 改成 'deleted'） 

提示: 最舊 可以用 ORDER BY DESC(遞減排序)
*/

UPDATE logs
SET `action` = 'deleted'
ORDER BY `created_at` ASC LIMIT 3; 