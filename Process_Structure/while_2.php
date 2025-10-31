<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    //尋找字元 > 需要把想要尋找的字串遍歷
        $char = "hello world";
        $want_find = "he";
        $position = [];
        $index = 0;
        $char_len = strlen($char);
        $find_len = strlen($want_find);
        
        
        while($index <= $char_len - $find_len) {
            $found = true;
            for($i=0; $i < $find_len; $i++) {
                if($char[$index + $i] != $want_find[$i]) {
                    $found = false;
                    break;
                }
            }
            if($found) {
                $position[] = $index;
                $index += $find_len;
            }else {
                $index +=1;
            }
        }

        if(!empty($position)) {
            echo "找到 '$want_find' 在以下位置 :" . implode(",", $position);
        }else{
            echo "找不到 '$want_find'";
        }
    ?>
</body>
</html>