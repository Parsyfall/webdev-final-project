<?php
function validateEmail($email)
{
    return filter_var($email, FILTER_VALIDATE_EMAIL);
}

function validatePassword($password, &$error)
{
    trim($password);

    $uppercase = preg_match("/[A-Z]+/", $password);
    $digits = preg_match('/\d+/', $password);
    $lowercase = preg_match('/[a-z]+/', $password);
    $length = strlen($password);

    if ($uppercase == false) {
        $error = 'Password must contain at least one uppercase';
        return false;
    } elseif ($digits == false) {
        $error = 'Password must contain at least one digit';
        return false;
    } elseif ($lowercase == false) {
        $error = 'Password must contain at least one lowercase';
        return false;
    } elseif ($length < 8) {
        $error = 'Password must be at least 8 symbols long';
        return false;
    }
    return true;
}

function validateCNP($cnp, &$error)
{
    $len = strlen($cnp);
    $notDigits = preg_match("/([a-zA-Z])\s[$&+,:;=?@#|'<>.-^*()%!]/", $cnp);
    if ($len != 13) {
        $error = 'CNP must be exactly 13 digits long';
        return false;
    }
    if ($notDigits != false) {
        $error = 'CNP must contain only numbers';
        return false;
    }
    return true;
}

function kick_back($error, $location){
    $_SESSION['error'] = $error;
    header("Location: $location");
    die;
}
?>