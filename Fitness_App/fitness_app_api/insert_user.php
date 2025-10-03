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
    $check = $con->prepare("SELECT id FROM users WHERE email = ?");
    $check->bind_param("s", $email);
    $check->execute();
    $check->store_result();

    if ($check->num_rows > 0) {
        echo json_encode(["status" => "error", "message" => "Email already exists"]);
    } else {
        $stmt = $con->prepare("INSERT INTO users (name, email, password, height, weight, gender, date_of_birth) 
                               VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssssss", $name, $email, $password, $height, $weight, $gender, $dob);

        if ($stmt->execute()) {
            echo json_encode(["status" => "success", "message" => "User registered"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Insert failed"]);
        }
    }
} else {
    echo json_encode(["status" => "error", "message" => "Missing required fields"]);
}
?>