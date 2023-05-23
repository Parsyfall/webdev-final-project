<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/login.css">
    <title>Log In</title>
</head>

<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="./php/auth.php" method="post" enctype="multipart/form-data">
            <form>
                <div class="email">
                    <label for="email"><b>Email</b></label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="pswd">
                    <label for="password"><b>Password&nbsp;</b></label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="error">
                    <?php
                    if (isset($_SESSION['error'])) {
                        echo $_SESSION['error'];
                        $_SESSION['error'] = '';
                    } ?>
                </div>
                <div class="btn">
                    <button type="submit">Login</button>
                </div>
                <div class="rmbr">
                    <input type="checkbox" name="remember">
                    <label for="remember">Remeber me</label>
                </div>
                <div class="forgot">
                    <a href="#">Forgot password</a>
                </div>
                <div class="new-acc">
                    Don't have an account? <a href="register.php">Create one</a>
                </div>
            </form>
    </div>
</body>

</html>