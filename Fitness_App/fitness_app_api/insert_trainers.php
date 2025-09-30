<?php
include "connect.php";

$name = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$phone = $_POST['phone'] ?? '';
$specialty = $_POST['specialty'] ?? '';
$experience = $_POST['experience'] ?? '';
$status = 'pending'; 

if ($name && $email) {
    $check = $conn->prepare("SELECT id FROM trainers WHERE email=?");
    $check->bind_param("s", $email);
    $check->execute();
    $check->store_result();

    if ($check->num_rows > 0) {
        echo json_encode(["status"=>"error","message"=>"Trainer email already exists"]);
    } else {
        $stmt = $conn->prepare("INSERT INTO trainers (name, email, phone, specialty, experience, status) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssis", $name, $email, $phone, $specialty, $experience, $status);

        if ($stmt->execute()) {
            echo json_encode(["status"=>"success","message"=>"Trainer registered"]);
        } else {
            echo json_encode(["status"=>"error","message"=>"Insert failed"]);
        }
    }
} else {
    echo json_encode(["status"=>"error","message"=>"Name and email are required"]);
}
?>
