/* TODO: .book-container .new-item  display none on open menu */
function displayMobileMenu(){
    // Hide menu and logo icons
    document.getElementById("mobileMenuIcon").style.display = "none";
    document.getElementById("logoIcon").style.display = "none";
    
    // Display mobile menu
    document.getElementById("mobileMenu").style.display = "block";
    document.getElementById("mobileMenu").style.zIndex= 1;
}

function hideMobileMenu(){
    // Hide mobile menu
    document.getElementById("mobileMenu").style.display = "none";
    
    // Show menu and logo icons 
    document.getElementById("logoIcon").style.display = "inline";
    document.getElementById("mobileMenuIcon").style.display = "inline";
}

function leftScroll() {
    const left = document.querySelector(".scroll-books");
    left.scrollBy(-250, 0);
  }

function rightScroll() {
    const right = document.querySelector(".scroll-books");
    right.scrollBy(250, 0);
  }