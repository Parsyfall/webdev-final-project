<?php
require('mysql.php');
session_start();

if (!isset($_SESSION['loged']) or $_SESSION['loged'] == false) {
    echo 'Not logged in';
    header("Location: ../login.php");
}


$bookId = $_GET['id'];
$userEmail = $_SESSION['user'];
$userCNP = $connection->query("SELECT cnp from clienti where email='$userEmail'")->fetch_assoc();

/* Check for book in user's active borrow list */
$stmt = $connection->prepare("SELECT id_carte from formular_imprumut where id_carte=?;");
$stmt->bind_param("i", $bookId);
$stmt->execute();

if ($stmt->get_result()->num_rows == 0) { // Borrow the book
    mysqli_query($connection, "UPDATE carte set stoc = stoc - 1 where id='$bookId'");   // Withdraw a book from stock
    $stmt = $connection->prepare("INSERT into formular_imprumut(id_carte, cnp_client) values(?,?);");
    $stmt->bind_param("is", $bookId, $userCNP['cnp']);
    $stmt->execute();
}

header('Location: ../cart.php');
