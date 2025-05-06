<?php
$host = "localhost";
$user = "root";       // Default XAMPP username
$password = "";       // Default XAMPP password (empty)
$database = "ice_cream_shop";  // Must match the database you created

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>