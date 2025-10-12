<?php
include "connect.php";

$name = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';
$gender = $_POST['gender'] ?? null;
$dob = $_POST['dob'] ?? null;
$height = $_POST['height'] ?? null;
$weight = $_POST['weight'] ?? null;

if ($name && $email && $password) {
    $check = $conn->prepare("SELECT id FROM users WHERE email = ?");
    $check->bind_param("s", $email);
    $check->execute();
    $check->store_result();

    if ($check->num_rows > 0) {
        echo json_encode(["status" => "error", "message" => "Email already exists"]);
        exit;
    } 

    $password_hash = password_hash($password, PASSWORD_DEFAULT);
    $stmt = $conn->prepare(
        "INSERT INTO users (name, email, password, height, weight, gender, date_of_birth)
         VALUES (?, ?, ?, ?, ?, ?, ?)"
    );

    if (!$stmt) {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => "DB prepare failed"]);
        exit;
    }

    $stmt->bind_param("sssssss", $name, $email, $password_hash, $height, $weight, $gender, $dob);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "User registered"]);
    } else {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => "Insert failed: " . $stmt->error]);
    } 
} else {
    echo json_encode(["status" => "error", "message" => "Missing required fields"]);
}
?>