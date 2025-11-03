<?php
// 請說明 封裝 (Encapsulation)、繼承 (Inheritance)、多型 (Polymorphism) 的差異與使用時機。



// 以下程式會輸出什麼？
class A {
    public $value = 10;
    public function getValue() {
        return $this->value;
    }
}

class B extends A {
    public $value = 20;
}

$b = new B();
echo $b->getValue();

// 2. 20 

// 3.變數與參考
// 以下程式結果為？

$a = 5;
$b = &$a;
$b = 10;
echo $a;

// 3. 10

// 4.Session vs Cookie

// 請比較 session 與 cookie 差異、儲存位置、使用情境，並簡單示範 session 設置與取得。
/* session 儲存sever
cookie 儲存在使用者
session 傳送帳號資訊
cookie  儲存廣告 與session識別id */
session_start();
$_SESSION['admin'];

// 資安題

// 請問如何防止 SQL Injection 與 XSS攻擊？
// 請寫出 PHP PDO 使用 prepared statement 的範例。

// 運用prepare stmt
// 2.不會寫

/* SQL 題目 (5題)
1️⃣ 基本查詢

有 users 資料表 id, name, email, created_at
查出最近 7 天註冊的使用者： */

// $sql = select `created_at` from  users u where getnow() -7 DAY
// select * from users where create_at >=now() interval -7 day;

/* 2️⃣ GROUP BY

訂單資料表 orders: user_id, amount
查每位使用者的消費總額： */

// select sum(admount) = total_amount from orders.user_id = users.id group by orders.user_id
// select user_id, sum(amount) as total_amount from orders group by user_id

/* 3️⃣ JOIN

查詢每筆訂單與該使用者姓名 (users + orders) */

// select users.name from users u join orders o on u.id=o.user_id
// seect u.name, o.amount from users u join orders o on u.id=o.user_id ;

/* 4️⃣ UPDATE

將所有 order.amount < 0 的訂單更新為 0： */

// update orders o set o.amount = 0 where o.amount < 0;

/* INDEX 概念題

INDEX 是什麼？
何時需要建立 index？
哪種欄位不適合建立 index？ */
// 需快要快速查詢的欄位
// 常搜尋、join欄位、unique欄位(mail)
// 低選擇性的 像是性別、飲料冷熱度 小資料表


function twoSum($nums, $target) {
    // 實作
    $map = [];
    foreach ($nums as $i => $value) {
        $diff = $target - $value;
        if(isset($map[$diff])) {
            return [$map[$diff],$i];
        }
        $map[$value] = $i;
    }

}

// 加分題（面試官常問）

// 設計資料庫「會員與角色」關係 → 請描述：

// Table 結構

// 一對多 vs 多對多
// 一個會員可以擁有多筆訂單
// 一個會員可以選擇多項商品，商品可以被多個會員選擇

// 動態角色授權設計概念
?>