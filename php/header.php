<div class="mobile-menu" id="mobileMenu">
    <nav>
        <h1 onclick="hideMobileMenu()">X</h1>
        <ul>
            <li><a href="./main.php" onclick="hideMobileMenu()">Home</a></li>
            <li><a href="./cart.php" onclick="hideMobileMenu()">Borrow list</a></li>
            <?php
            if (isset($_SESSION['loged']) && $_SESSION['loged'] == true) {
                echo "<li><a href=\"./php/logout.php\" onclick=\"hideMobileMenu()\">Log Out</a></li>";
            } else {
                echo "<li><a href=\"./login.php\" onclick=\"hideMobileMenu()\">Log In</a></li>";
            }
            ?>
        </ul>
    </nav>
</div>
<header>
    <div class="nav-container">
        <nav>
            <a href="main.php"><img id="logoIcon" src="./img/main-icon.svg" alt="main-icon"></a>
            <div id="desktop-menu">
                <ul>
                    <li><a href="./main.php">Home</a></li>
                    <li><a href="./cart.php">Borrow list</a></li>
                    <?php
                    if (isset($_SESSION['loged']) && $_SESSION['loged'] == true) {
                        echo "  <li class=\"dropdown\">";
                        echo "  <img id=\"user-icon\" src=\"./img/user.png\" alt=\"user-icon\">";
                        echo "  <ul class=\"drop-menu\">";
                        echo "      <li class=\"drop-menu-item\">";
                        echo "          <a href=\"./php/logout.php\">Log Out</a>";
                        echo "      </li>";
                        echo "  </ul>";
                        echo "</li>";
                    } else {
                        echo "<li><a id=\"log-in\" href=\"./login.php\">Log In</a></li>";
                    }
                    ?>
                </ul>
            </div>
            <img src="./img/burger-menu.png" alt="burger" id="mobileMenuIcon" onclick="displayMobileMenu()">
        </nav>
    </div>
</header>
<main>