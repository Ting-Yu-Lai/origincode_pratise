<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    $score = 87;
    if($score > 0 && $score < 60 ) {
        echo "E";
    }
    if($score >= 60 && $score < 70 ) {
        echo "D";
    }
    if($score >= 70 && $score < 80 ) {
        echo "C";
    }
    if($score >= 80 && $score < 90 ) {
        echo "B";
    }
    if($score >= 90 && $score < 100 ) {
        echo "A";
    }
    // if($score > 60) {
    // echo "及格了";
    // }else {
    // echo "不及格";
    // }
    ?>
</body>

</html>