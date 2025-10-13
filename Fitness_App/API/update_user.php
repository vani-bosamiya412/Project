<?php
include "connect.php";

$id = $_POST['id'] ?? '';
$name = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';
$gender = $_POST['gender'] ?? null;
$dob = $_POST['dob'] ?? null;
$height = $_POST['height'] ?? null;
$weight = $_POST['weight'] ?? null;

if ($id) {
    $stmt = $conn->prepare("UPDATE vani_users 
                           SET name=?, email=?, password=?, height=?, weight=?, gender=?, date_of_birth=? 
                           WHERE id=?");
    $stmt->bind_param("sssssssi", $name, $email, $password, $height, $weight, $gender, $dob, $id);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "User updated"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Update failed"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "User ID required"]);
}
?>
