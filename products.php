<?php
require_once 'db_connect.php';

header('Content-Type: application/json');

$query = "SELECT * FROM products"; // Make sure this table exists
$result = $conn->query($query);

$products = [];
while ($row = $result->fetch_assoc()) {
    $products[] = $row;
}

echo json_encode(['success' => true, 'products' => $products]);

$conn->close();
?>
