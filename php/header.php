<header>
    <div class="nav-container">
        <nav>
            <a href="main.php"><img src="./img/main-icon.svg" alt="main-icon"></a>
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
            <!-- <div id="mobile-menu">
                <ul>
                    <img id="mobil-menu-icon" src="./img/burger-menue.png" alt="burgerMenu">
                    <li>
                        <h2>X</h2>
                    </li>
                    <hr>
                    <li><a href="./main.php">Home</a></li>
                    <hr>
                    <li><a href="./cart.php">Borrow list</a></li>
                    <hr>
                    <li>Account</li>
                    <hr>
                </ul>
            </div> -->
        </nav>
    </div>
</header>