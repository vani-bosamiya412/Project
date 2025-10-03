<?php
    include "connect.php";

    $id = $_GET['id'] ?? '';

    if ($id) {
        $stmt = $con->prepare("SELECT id, name, email, height, weight, gender, date_of_birth FROM users WHERE id = ?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result()->fetch_assoc();
        echo json_encode($result ?: ["status" => "error", "message" => "User not found"]);
    } else {
        $result = $con->query("SELECT id, name, email, height, weight, gender, date_of_birth FROM users");
        $users = [];
        while ($row = $result->fetch_assoc()) {
            $users[] = $row;
        }
        echo json_encode($users);
    }
?>