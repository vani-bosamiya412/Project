<?php
    include "connect.php";

    $id = $_POST['id'] ?? '';

    if ($id) {
        $stmt = $conn->prepare("DELETE FROM trainers WHERE id=?");
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            echo json_encode(["status"=>"success","message"=>"Trainer deleted"]);
        } else {
            echo json_encode(["status"=>"error","message"=>"Delete failed"]);
        }
    } else {
        echo json_encode(["status"=>"error","message"=>"Trainer ID required"]);
    }
?>
