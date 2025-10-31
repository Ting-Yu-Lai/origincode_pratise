<?php
/* 
344. Reverse String
Example 1:

Input: s = ["h","e","l","l","o"]
Output: ["o","l","l","e","h"]
Example 2:

Input: s = ["H","a","n","n","a","h"]
Output: ["h","a","n","n","a","H"] 

     * @param String[] $s
     * @return NULL

因為要return NULL 所以 $s 裡面交換 -> 所以要用數值交換法 宣告tmp
*/

function reverseString($s)
{
    $left = 0;
    $right = count($s) - 1;
    // 直到 left 小於 right
    while ($left < $right) {
        $tmp = $s[$right];
        $s[$left] = $s[$right];
        $s[$left] = $tmp;
        $left++;
        $right--;
    }
    return NULL;
}

/* php 內建有 array_reverse
function reverseString(&$s)
{
    $s = array_reverse($s);
    return null;
}
 */