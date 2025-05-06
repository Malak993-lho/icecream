<?php
$conn = new mysqli("localhost", "root", "", "ice_cream_shop");

if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Connection failed: " . $conn->connect_error]));
}
?>
