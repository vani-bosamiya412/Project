<?php
    include "connect.php";

    header('Content-Type: application/json; charset=utf-8');

    $id = $_GET['id'] ?? '';

    $cols = "id, name, email, password, height, weight, gender, date_of_birth";

    if ($id > 0) {
        $stmt = $conn->prepare("SELECT $cols FROM vani_users WHERE id = ?");
        if (!$stmt) {
            http_response_code(500);
            echo json_encode(["status" => "error", "message" => "DB prepare failed"]);
            exit;
        }
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result ? $result->fetch_assoc() : null;

        if (!$user) {
            http_response_code(404);
            echo json_encode(["status" => "error", "message" => "User not found"]);
            exit;
        }
        echo json_encode($user);
        exit;
    } else {
        $result = $conn->query("SELECT $cols FROM vani_users");
        if (!$result) {
            http_response_code(500);
            echo json_encode(["status" => "error", "message" => "DB query failed"]);
            exit;
        }
        $users = [];
        while ($row = $result->fetch_assoc()) {
            $users[] = $row;
        }
        echo json_encode($users);
        exit;
    }
?>