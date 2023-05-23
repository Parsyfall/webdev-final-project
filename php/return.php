<?php
    require('mysql.php');
    session_start();

    $opperationID = $_GET['id'];

    $stmt = $connection->prepare("SELECT client_email from formular_imprumut_view where id_operatie = ?");
    $stmt->bind_param("i", $opperationID);
    $stmt->execute();
    $result = $stmt->get_result();

    /* Check if there is such a transation */
    if($result->num_rows == 0){
        header("Location: ../cart.php");
    }

    /* Check if user had borrowed this book */
    $email = $result->fetch_assoc();
    if($email['client_email'] !== $_SESSION['user']){
        header("Location: ../cart.php");
    }

    /* Execute "return" */
    $stmt = $connection->prepare("DELETE from formular_imprumut where id_tranzactie= ?");
    $stmt->bind_param("i", $opperationID);
    $stmt->execute();
    
    header("Location: ../cart.php");
?>