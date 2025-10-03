<?php
    include "connect.php";

    $id     = $_POST['id'] ?? '';
    $status = $_POST['status'] ?? ''; 

    if ($id && in_array($status, ['approved','rejected'])) {
        $stmt = $con->prepare("UPDATE trainers SET status=? WHERE id=?");
        $stmt->bind_param("si", $status, $id);

        if ($stmt->execute()) {
            echo json_encode(["status"=>"success","message"=>"Trainer status updated"]);
        } else {
            echo json_encode(["status"=>"error","message"=>"Update failed"]);
        }
    } else {
        echo json_encode(["status"=>"error","message"=>"Trainer ID and valid status required"]);
    }
?>