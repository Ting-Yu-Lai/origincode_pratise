<!-- 
Reverse String（原地反轉字串陣列）

Two Sum（找到兩數和為 target）

Valid Parentheses（括號匹配）

Remove Duplicates from Sorted Array（原地刪重）

FizzBuzz（1~n 判斷可被 3 / 5 整除輸出文字
-->

<?php
/**
 * 1. TowSum
     * @param int[] $nums
     * @param Integer $target
     * @return Integer[]
     * 會需要印出[$i, $j] -> 所以會需要雙迴圈
     */
    /* 
    第一次解題自己想法
    問題:Two Sum 要找 任意兩個元素，不是只加相鄰兩個，需要雙迴圈（暴力法）或 hash map 優化
    function twoSum($nums, $target) {
        for($i = 0; $i < count($nums) - 1; $i++) {
            $tmp = $nums[$i] + $nums[$i+1];
            if($tmp == $target) {
                return [$i,$tmp-$i];
            }
            $i++;
        }        
    } */
   function twoSum($nums, $target) {
    // 先計算陣列長度
    $n = count($nums);
    for($i = 0; $i < $n; $i++) {
        for($j = $i + 1;$j < $n; $j++) {
            if($nums[$i]+$nums[$j] == $target) {
                return [$i, $j];
            }
        }
    }
   }
   // hashmap
?>