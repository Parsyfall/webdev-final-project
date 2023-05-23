<?php
require('mysql.php');
include('validation.php');
session_start();

$cnp = strip_tags($_POST['cnp']);
$name = strip_tags($_POST['name']);
$surname = strip_tags($_POST['surname']);
$email = strip_tags($_POST['email']);
$password = strip_tags($_POST['password']);
$repassword = strip_tags($_POST['repeat-password']);
$error = '';

/* ---- Check for in use cnp and mails ---- */
$stmt = $connection->query("SELECT * from clienti where email='$cnp';");
if ($stmt->num_rows != 0) {
    kick_back('CNP already in use', '../register.php');
}

$stmt = $connection->query("SELECT * from clienti where email='$email';");
if ($stmt->num_rows != 0) {
    kick_back('Email already in use', '../register.php');
}
/* ----------------------------------------- */

if (!validateEmail($email)) {
    kick_back('Invalid email', '../register.php');
}
if (!validatePassword($password, $error) && !validateCNP($cnp, $error)) {
    kick_back($error, '../register.php');
}
if (strcmp($password, $repassword) != 0) {
    kick_back('Passwords must match', '../register.php');
}

$hash = password_hash($password, PASSWORD_BCRYPT);

$stmt = $connection->prepare("INSERT into clienti values(?, ?, ?, ?, ?);");
$stmt->bind_param('sssss', $cnp, $name, $surname, $email, $hash);
$stmt->execute();

$_SESSION['loged'] = true;
$_SESSION['user'] = $email;

header('Location: ../main.php');
