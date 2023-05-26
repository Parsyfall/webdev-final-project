<?php
require('./php/mysql.php');
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/book.css">
    <script src="./script/navigation.js"></script>
    <title>MyLibrary</title>
</head>

<body>
    <?php
    require('./php/header.php');
    $bookID = $_GET['id'];
    $stmt = $connection->query("SELECT * from complete_carte_view where id=" . $bookID . "; ");
    $content = $stmt->fetch_assoc();
    $stmt = $connection->query("SELECT cover from carte where id=" . $bookID  . ";");
    $cover = $stmt->fetch_assoc();
    ?>
    <div class="main-element">
        <section class="book-cover">
            <?php
            echo "<img src=./img/cover/" . $cover['cover'] . " alt=\"" . $content['Titlu'] . "\">";
            $stoc = $content['Stoc'];
            $ID = $content['ID'];
            include('./php/availability.php');
            ?>
        </section>
        <div class="book-info">
            <section class="title">
                <p>
                    <?php
                    echo "<h1>" . $content['Titlu'] . "</h1>";
                    echo "de <span id=\"author\">" . $content['Autor'] . "</span>";
                    ?>
                </p>
            </section>
            <section class="book-details">
                <h2>Book details</h2>
                <hr>
                <h3>Data apariției:<?php echo date_format(date_create($content['Publicare']), 'd F Y') ?></h3>
                <h3>ISBN: <?php
                            echo substr($content['ISBN'], 0, 3) . '-' . substr($content['ISBN'], 4, 3);
                            echo '-' . substr($content['ISBN'], 7, 2) . '-' . substr($content['ISBN'], 9, 4) . '-' . substr($content['ISBN'], 11, 1)
                            ?> </h3>
                <h3>Cod bară: <?php echo $content['ISBN'] ?> </h3>
                <h3>Autor(i): <?php echo $content['Autor'] ?></h3>
                <h3>Editura: <?php echo $content['Editura'] ?></h3>
                <h3>Genuri: <?php echo $content['Categorii'] ?></h3>

            </section>
        </div>
    </div>
    <div class="side-scroll">
        <h2>Te-ar putea interesa și ...</h2>
        <div class="side-scroll-wrapper">
            <div class="side-scroll-controls">
                <div class="left" onclick="leftScroll()"> </div>
                <div class="right" onclick="rightScroll()"> </div>
            </div>
            <div class="scroll-books">
                <?php
                $stmt = $connection->prepare("CALL might_interest(?);");
                $stmt->bind_param('i', $bookID);
                $stmt->execute();
                $result = $stmt->get_result();
                while ($el = $result->fetch_assoc()) {
                    echo "<div class=\"book\">";
                    echo "<div class=\"cover\">";
                    echo "<img src=\"img/cover/" . $el['cover'] . "\" alt=\"\">";
                    echo "</div>";
                    echo "<h2><a href=\"book.php?id=" . $el['id'] . "\">" . $el['titlu_carte'] . "</a></h2>";
                    echo "</div>";
                }
                ?>
            </div>
        </div>

    </div>

    <?php require('./php/footer.php'); ?>

</body>

</html>
<?php  ?>