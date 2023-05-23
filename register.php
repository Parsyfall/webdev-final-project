<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/register.css">
    <title>Log In</title>
</head>

<body>
    <div class="login-container">
        <h2>Register now</h2>
        <form action="./php/reg.php" method="post" enctype="multipart/form-data">
            <div class="fields">
                <form>
                    <div class="first-column">
                        <div class="cnp">
                            <label for="cnp"><b>CNP</b></label>
                            <input type="text" id="cnp" name="cnp" required>
                        </div>
                        <div class="name">
                            <label for="name"><b>Name</b></label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="srname">
                            <label for="surname"><b>Surname</b></label>
                            <input type="text" id="surname" name="surname" required>
                        </div>

                    </div>
                    <div class="second-column">
                        <div class="email">
                            <label for="email"><b>Email</b></label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div class="pswd">
                            <label for="password"><b>Password&nbsp;</b></label>
                            <input type="password" id="password" name="password" required>
                        </div>
                        <div class="rpt">
                            <label for="repeat-password"><b>Repeat password</b></label>
                            <input type="password" id="repeat" name="repeat-password" required>
                        </div>
                    </div>
            </div>
            <div class="error">
                <?php if (isset($_SESSION['error'])) {
                    echo $_SESSION['error'];
                    $_SESSION['error'] = '';
                } ?>
            </div>
            <div class="btn">
                <button type="submit">Register</button>
            </div>
            <div class="old-acc">
                Already have an account? <a href="login.php">Sign In</a>
            </div>
        </form>
    </div>
</body>

</html>