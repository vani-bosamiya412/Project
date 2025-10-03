<?php
    include "connect.php";

    $id = $_POST['id'] ?? '';
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $phone = $_POST['phone'] ?? '';
    $specialty = $_POST['specialty'] ?? '';
    $experience = $_POST['experience'] ?? '';

    if ($id) {
        $stmt = $con->prepare("UPDATE trainers SET name=?, email=?, phone=?, specialty=?, experience=? WHERE id=?");
        $stmt->bind_param("ssssii", $name, $email, $phone, $specialty, $experience, $id);

        if ($stmt->execute()) {
            echo json_encode(["status"=>"success","message"=>"Trainer updated"]);
        } else {
            echo json_encode(["status"=>"error","message"=>"Update failed"]);
        }
    } else {
        echo json_encode(["status"=>"error","message"=>"Trainer ID required"]);
    }
?>
