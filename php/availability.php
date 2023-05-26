<?php
if ($stoc > 0) {
    echo "<div id=\"borrow\" class=\"button\"><a href=\"php/add2cart.php?id=". $ID ."\">Borrow</a></div>";
} else {
    echo "<div id=\"checked-out\" class=\"button\"><a href=\"book.php?id=". $ID ."\" title=\"All exemplars are borrowed\">Checked out</a></div>";
}
?>