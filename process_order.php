<?php
header('Content-Type: application/json');
file_put_contents("debug_log.txt", "Script started\n", FILE_APPEND);

// Connect to MySQL
$conn = new mysqli("localhost", "root", "", "ice_cream_shop");
if ($conn->connect_error) {
    echo json_encode(["success" => false, "message" => "DB connection failed: " . $conn->connect_error]);
    exit;
}

// Collect form data
$name = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$phone = preg_replace('/[^\d+]/', '', $_POST['phone'] ?? '');
$items = $_POST['cart_items'] ?? '';
$total = $_POST['total'] ?? '';
$note = $_POST['note'] ?? '';
$order_date = time();

// Validate input
if (empty($name) || empty($email) || empty($phone) || empty($items) || empty($total)) {
    echo json_encode(["success" => false, "message" => "Missing required fields"]);
    exit;
}

// Prepare SQL (now includes `items` and `note`)
$stmt = $conn->prepare("INSERT INTO orders (customer_name, email, phone, items, note, total_price, order_date) VALUES (?, ?, ?, ?, ?, ?, ?)");
if (!$stmt) {
    echo json_encode(["success" => false, "message" => "Prepare failed: " . $conn->error]);
    exit;
}

// Bind and execute
$stmt->bind_param("sssssdi", $name, $email, $phone, $items, $note, $total, $order_date);
if ($stmt->execute()) {
    echo json_encode([
        "success" => true,
        "message" => "Order received!",
        "order_id" => $stmt->insert_id
    ]);
} else {
    echo json_encode(["success" => false, "message" => "Insert failed: " . $stmt->error]);
}

$stmt->close();
$conn->close();
$conn = new mysqli("localhost", "root", "", "ice_cream_shop");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Collect form data
$name = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$phone = preg_replace('/[^\d+]/', '', $_POST['phone'] ?? '');
$items = $_POST['cart_items'] ?? '';
$total = $_POST['total'] ?? '';
$note = $_POST['note'] ?? '';
$order_date = time();

// Basic validation
if (empty($name) || empty($email) || empty($phone) || empty($items) || empty($total)) {
    die("Missing required fields");
}

// Insert into DB
$stmt = $conn->prepare("INSERT INTO orders (customer_name, email, phone, items, note, total_price, order_date) VALUES (?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("sssssdi", $name, $email, $phone, $items, $note, $total, $order_date);
$stmt->execute();
$stmt->close();
$conn->close();

// Redirect to thank you page
header("Location: thankyou.html");
exit;
?>
