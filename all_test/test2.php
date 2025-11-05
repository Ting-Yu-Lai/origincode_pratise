<?php
// Q1: == 只比較數值， === 比較型別與數值
// Q2: 
// 封裝 => 把資料與方法裝進class，設定private跟protected建立安全性
// private => 不能被繼承 protected => 可以在子類中被繼承使用
class Animal
{
    protected function sound()
    {
        echo "voice";
    }
}
// 繼承 => 繼承父備，主要目的為共用跟擴充
class Dog extends Animal
{
    function sound()
    {
        echo "woof";
    }
}
// 多型 => 不同的子類可以用相同的方式名稱，但實作不同行為
class Dog1 extends Animal
{
    function sound()
    {
        echo "woof";
    }
}
class Cat extends Animal
{
    function sound()
    {
        echo "meow";
    }
}
// Q3: 多型: 不同子類可以用相同的方式名稱，但實作不同行為
// Q4: 代表儲存址的概念
// Q5:
// include: 可以在程式碼過程中被判斷引入，發生問題只會跳出waring不會中斷程式，通常是引入模板
// require: 在程式編譯之前就需要引入，發生問題會跳出fattal error會中斷程式，通常是引入含式庫
// _once: 只會引入一次，不管後面有無再次使用都只引入一次

// Q6: inner join: 兩表有交集的地方才會出現 left join: 左表的所有值加上右表相同的部分，沒有數值會補上Null
// Q7: 
// 一對多:一間咖啡廳可以有多個管理者，但多個管理者是能屬於一間咖啡廳 admins(id, name, power)
// 多對多:會員可以選擇多樣商品，商品可以被多個會員選擇 users(id, name, product_id) product(id, product, user_id) ##我這邊的table表寫得不太好
// Q8: 因為只是拼接字串，而不是直接執行sql語句
// Q9. 會加速搜尋，建立樹搜尋表
// Q10. 什麼是 Transaction？什麼時候會用？

// Q11: 請解釋 XSS？怎麼防？ XSS是直接執行javascript 加上htmlspecialchars() 可以讓" => 轉譯成html解讀的檔案 但無法被直接執行
// Q12: CSRF 是什麼？如何防止？ 這個是POST傳送過程的密碼
// Q13: Cookie vs Session 差別？儲存在哪？
// Session: 儲存在server端，生命週期:通常關閉瀏覽器就關閉，當前後頁或是整理頁面會詢問表單是否銷毀，使用場景:後台權限控制
// Cookie: 儲存在user端，生命週期:可以設定時間(30天)，不會有前後頁，或是整理頁面問題，使用場景:紀錄sessionID，使用者習慣
// Q14: 可以讓" => 轉譯成html解讀的檔案 但無法被直接執行
// Q15. 使用power_hash 建立密碼，讓密碼變成加密的方式

// Q16: 優化資料庫查詢、尋找大量發送請求的位址
// Q17: 1.扣減程式碼出問題，查詢近期扣減訂單 => 我這邊的想法沒有很清楚，而且我不理解怎樣算是異常，要怎麼一開始就確定異常了
// Q18: 先確認是否會干擾到主程式運行，先搞清楚嚴重程度，最後徹夜修改bug
// Q19: 你遇過最難的 bug？你怎麼解？
// Q20: 與對方詳細討論對方思考的邏輯，意見不同時最重要的是聽，理解對方的想法，最後向對方分享自己的想法 盡力求同除異

// Q21. PHP：判斷字串是否為回文
function isPalindrome($str)
{
    $stack = [];
    $s = count($str);
    for ($i = 0; $i < $s - 1; $i++) {
        $match = array_pop($stack);
        if ($match == $i) {
            return true;
        }
        $stack = array_push($str[$i]);
    }
    return false;
}

// Q22. PHP：陣列找最大值（不能用 max()）
$arr = [10, 5, 30, 2];
$arr_count = count($arr);
$max = $arr[0];
for ($i = 0; $i < $arr_count - 1; $i++) {
    if ($arr[$i + 1] > $max) {
        $max = $arr[$i + 1];
    }
}
return $max;

// Q23. SQL：找出 age > 30 的使用者，依年齡高 → 低排序，取 5 筆
// users(id, name, age)
/* ```sql
SELECT name, age FROM users WHERE age > 30 GROUP BY age DESC LIMIT 5;
``` */

// Q24. SQL：更新 id=10 的使用者名稱為 "Leo"
/* ```sql
UPDATE users SET name = "LEO" WHERE id = 10;
``` */

// Q25. LeetCode Easy：Two Sum 思考題（口述流程即可）
/* 暴力拆解:運用兩層迴圈 相加= $target
hashmap:儲存差異 $diff = $target - $value  如果沒有就儲存差異的value跟index到map 下一個要找差異就在map裡，剛好是差異的值 就印出兩個index*/