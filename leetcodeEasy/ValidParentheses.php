<?php

/**
 * 20. Valid Parentheses

 
 * @param String $s
 * @return Boolean
 */
function isValid($s)
{
    if (strlen($s) % 2 == 1) return false;

    $stack = [];
    $pairs = [
        ")" => "(",
        "}" => "{",
        "]" => "["
    ];
    $n = strlen($s);
    for ($i = 0; $i < $n; $i++) {
        $ch = $s[$i];

        //如果是右括號 檢查stack頂端是否為對應的左括號
        if (isset($pairs[$ch])) {
            $top = array_pop($stack);
            if ($top !== $pairs[$ch]) {
                return false;
            }
        } else {
            $stack[] = $ch;
        }
    }

    return empty($stack);
}
