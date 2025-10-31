<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        $n = 97;
        $i = 3;
        // while ($i <= $n) {
        //     $is_prime = true;
        //     $j = 3;
        //     while($j * $j <= $i) {
        //         if($i % $j == 0) {
        //             $is_prime = false;
        //             break;
        //         }
        //         $j += 2;
        //     }
        //     if($is_prime) {
        //         echo $i . " ";
        //     }
        //     $i += 2;
        // }
        for($i = 3; $i <= $n; $i+=2) {
            $is_prime = true;
            for($j = 3; $j * $j <= $i; $j+=2) {
                if($i % $j == 0) {
                    $is_prime = false;
                    break;
                }
            }
            if($is_prime) {
                echo $i . " ";
            }
        }
    ?>
</body>
</html>