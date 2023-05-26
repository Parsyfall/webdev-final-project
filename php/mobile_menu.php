<div class="mobile-menu" id="mobileMenu">
    <nav>
        <h1 onclick="hideMobileMenu()">X</h1>
        <ul>
            <li><a href="./main.php">Home</a></li>
            <li><a href="./cart.php">Borrow list</a></li>
            <?php
            if (isset($_SESSION['loged']) && $_SESSION['loged'] == true) {
                echo "<li><a href=\"./php/logout.php\">Log Out</a></li>";
            } else {
                echo "<li><a href=\"./login.php\">Log In</a></li>";
            }
            ?>
        </ul>
    </nav>
</div>