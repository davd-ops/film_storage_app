<?php
session_start();
// Destroy session
if(session_destroy()) {
    // Redirecting To Login Page
    header("Location: login.php");
}
