<?php
session_start();
$_SESSION['error'] = '';
require('php/mysql.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/index.css">
    <title>MyLibrary</title>
</head>

<body>
    <?php
    require('./php/header.php');
    ?>
    <main>
        <div class="main-container">
            <?php
            $stmt = $connection->query("SELECT * from main_page_view order by data_publicarii desc limit 30; ");
            $today = strtotime(date('Y-m-d'));
            while ($el = $stmt->fetch_assoc()) {
                $publication = strtotime($el['data_publicarii']);
                $days = ($today - $publication) / 86400;

                echo "<div class=\"book-container\">";
                if ($days <= 2 * 365) {
                    echo "<div class=\"new-item\"></div>";
                }
                echo "<section>";
                echo "<div class=\"image\">";
                echo   "<a href=\"book.php?id=" . $el['id'] . "\"><img src= \"./img/cover/" . $el['cover'] . "\" alt=\"cover\"></a>";
                echo "</div>";
                echo "<div class=\"info\">";
                echo  "<a href=\"book.php?id=" . $el['id'] . "\"><span class=\"title\">" . $el['titlu_carte'] . "</span></a>";
                echo "<span class=\"author\">" . $el['autor'] . "</span>";
                echo "</div>";
                $stoc = $el['stoc'];
                $ID = $el['id'];
                include('./php/availability.php');
                echo "</section>";
                echo "</div>";
            }
            ?>


        </div>
        <!-- <form action="book.php?id=5" method="post">
            <button type="submit">Click</button>
        </form> -->

    </main>
    <!-- Latest books, published within a year -->
</body>

</html>