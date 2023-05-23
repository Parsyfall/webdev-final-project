<?php
require('./php/mysql.php');
session_start();
if (!$_SESSION['loged']) {
    header('Location: login.php');
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="css/cart.css">
    <title>Borrowed books</title>
</head>

<body>
    <main>
        <?php require('./php/header.php'); ?>
        <div class="content-wrap">
            <?php
            $stmt = $connection->query("SELECT * from formular_imprumut_view where client_email=\"" . $_SESSION['user'] . "\";");
            if ($stmt->num_rows == 0) {
                echo "<div class=\"nothing\">Nu aveti carti imprumutate ¯\_(ツ)_/¯</div>";
            }
            while ($row = $stmt->fetch_assoc()) {
                echo "    <div class=\"book-container\">";
                echo "    <div class=\"cover\">";
                echo "        <img src=\"./img/cover/" . $row['Cover'] . "\" alt=\"cover\">";
                echo "    </div>";
                echo "    <section class=\"info\">";
                echo "        <div class=\"content\">";
                echo "            <div class=\"title\">";
                echo "                <h2>" . $row['Titlu'] . "</h2>";
                echo "            </div>";
                echo "            <div class=\"return\">";
                echo "                <a href=\"./php/return.php?id=" . $row['id_operatie'] . "\">Return</a>";
                echo "            </div>";
                echo "        </div>";
                echo "    </section>";
                echo "</div>";
            }
            ?>
        </div>
    </main>
</body>

</html>