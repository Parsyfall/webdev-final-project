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
    <title>MyLibrary</title>
</head>

<body>
    <main>
        <?php
        require('./php/header.php');
        $stmt = $connection->query("SELECT * from complete_carte_view where id=" . $_GET['id'] . "; ");
        $content = $stmt->fetch_assoc();
        // print_r($content);
        $stmt = $connection->query("SELECT cover from carte where id=" . $_GET['id'] . ";");
        $cover = $stmt->fetch_assoc();
        // print_r($cover);\
        ?>
        <div class="main">
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

    </main>

</body>

</html>
<?php  ?>