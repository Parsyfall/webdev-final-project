<?php
require('mysql.php');
include('validation.php');
session_start();

$email = $password = $error = '';

$email = strip_tags($_POST['email']);
$password = strip_tags($_POST['password']);

if (!validateEmail($email)) {
    kick_back('Invalid email', '../login.php');
}
if (!validatePassword($password, $error)) {
    kick_back($error, '../login.php');
}

$stmt = $connection->prepare("SELECT parola from clienti where email = ?");
$stmt->bind_param('s', $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows == 0) {
    kick_back('Unexistent user', '../login.php');
}

$hash = $result->fetch_assoc();
if (!password_verify($password, $hash['parola'])) {
    kick_back('Incorrect password', '../login.php');
}

$_SESSION['loged'] = true;
$_SESSION['user'] = $email;
header('Location: ../main.php');