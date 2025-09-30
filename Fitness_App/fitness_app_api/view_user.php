<?php
include "connect.php";

$id = $_GET['id'] ?? '';

if ($id) {
    $stmt = $conn->prepare("SELECT id, name, email FROM users WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_assoc();
    echo json_encode($result ?: ["status" => "error", "message" => "User not found"]);
} else {
    $result = $conn->query("SELECT id, name, email FROM users");
    $users = [];
    while ($row = $result->fetch_assoc()) {
        $users[] = $row;
    }
    echo json_encode($users);
}
?>