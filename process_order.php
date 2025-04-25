<?php
header('Content-Type: application/json');

try {
    // Connect to DB
    $conn = new mysqli("localhost", "root", "", "ice_cream_shop");
    if ($conn->connect_error) {
        throw new Exception("DB Connection Failed: " . $conn->connect_error);
    }

    // Get data
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $phone = $_POST['phone'] ?? '';
    $note = $_POST['note'] ?? '';
    $cart_items = $_POST['cart_items'] ?? '';
    $total = $_POST['total'] ?? '';
    $order_date = date("Y-m-d H:i:s");
    $status = "Pending";

    // Validate
    if (!$name || !$email || !$phone || !$cart_items || !$total) {
        throw new Exception("Missing required fields");
    }

    // Save to DB
    $stmt = $conn->prepare("INSERT INTO orders (customer_name, email, phone, note, cart_items, total_price, order_date, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssssdss", $name, $email, $phone, $note, $cart_items, $total, $order_date, $status);

    if ($stmt->execute()) {
        echo json_encode(["success" => true, "order_id" => $stmt->insert_id]);
    } else {
        throw new Exception("Insert failed: " . $stmt->error);
    }

    $stmt->close();
    $conn->close();
} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => $e->getMessage()]);
}
?>
