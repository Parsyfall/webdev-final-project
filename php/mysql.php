<?php
$hostname = 'db';
$username = 'student';
$password = 'student';
$database = 'biblioteca';

$connection = new mysqli($hostname, $username, $password, $database);
if ($connection->connect_error) {
    die('Connection error' . $connection->error);
}
