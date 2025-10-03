<?php
    include "connect.php";

    $id = $_GET['id'] ?? '';

    if ($id) {
        $stmt = $con->prepare("SELECT * FROM trainers WHERE id=?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result()->fetch_assoc();
        echo json_encode($result ?: ["status"=>"error","message"=>"Trainer not found"]);
    } else {
        $result = $con->query("SELECT * FROM trainers ORDER BY created_at DESC");
        $trainers = [];
        while ($row = $result->fetch_assoc()) {
            $trainers[] = $row;
        }
        echo json_encode($trainers);
    }
?>
