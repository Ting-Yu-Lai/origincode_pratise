<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        $char = "hello world";
        $want_find = "o";
        $position = [];
        $index = 0;
        $found = false;
        $char_len = strlen($char);
        $find_len = strlen($want_find);


        while($index <= $char_len - $find_len) {

            if($char[$index] == $want_find) {
                $position[] = $index;
                $found = true;
                $index += strlen($want_find);
            }else {
                $index +=1;
            }
        }

        if($found) {
            echo "找到 '$want_find' 在以下位置 :" . implode(",", $position);
        }else{
            echo "找不到 '$want_find'";
        }
    ?>
</body>
</html>