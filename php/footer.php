</main>
<footer>
    <div class="footer-wrapper">
        <section class="footer-menu">
            <h3>Menu</h3>
            <ul>
                <?php
                if (basename($_SERVER['SCRIPT_NAME'], '.php') == 'main') {
                    echo "<li><a href=\"#top\">Home</a></li>";
                } else {
                    echo "<li><a href=\"main.php\">Home</a></li>";
                }
                if (basename($_SERVER['SCRIPT_NAME'], '.php') == 'cart') {
                    echo "<li><a href=\"#top\">My books</a></li>";
                } else {
                    echo "<li><a href=\"cart.php\">My books</a></li>";
                }
                if (isset($_SESSION['loged']) && $_SESSION['loged'] == true) {
                    echo "<li><a href=\"./php/logout.php\">Log Out</a></li>";
                } else {
                    echo "<li><a id=\"log-in\" href=\"./login.php\">Log In</a></li>";
                }
                ?>
            </ul>
        </section>
        <section class="contact-us">
            <h3>Contact us</h3>
            <span>Telefon:</span> +40 (264) 593 111 <br>
            <span>Adresa: </span> Strada Regele Ferdinand 21, 400110
            <div class="social-media">
                <a href="https://www.instagram.com/"><img src="./img/instagram.png" alt="instagram"></a>
                <a href="https://www.facebook.com/"><img src="./img/facebook.png" alt="facebook"></a>
                <a href="https://www.twitter.com/"><img src="./img/twitter.png" alt="twitter"></a>
            </div>
        </section>
        <?php
        ?>
    </div>
</footer>