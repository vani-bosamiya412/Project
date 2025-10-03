<?php
    include "connect.php";

    $user_id = $_POST['user_id'] ?? '';
    $title   = $_POST['title'] ?? '';
    $message = $_POST['message'] ?? '';

    if ($title && $message) {
        if ($user_id) {
            $stmt = $con->prepare("INSERT INTO notifications (user_id, title, message) VALUES (?, ?, ?)");
            $stmt->bind_param("iss", $user_id, $title, $message);
        } else {
            $users = $con->query("SELECT id FROM users");
            $success = true;
            while ($row = $users->fetch_assoc()) {
                $stmt = $con->prepare("INSERT INTO notifications (user_id, title, message) VALUES (?, ?, ?)");
                $stmt->bind_param("iss", $row['id'], $title, $message);
                if (!$stmt->execute()) $success = false;
            }
            if ($success) {
                echo json_encode(["status"=>"success","message"=>"Broadcast sent"]);
                exit;
            } else {
                echo json_encode(["status"=>"error","message"=>"Broadcast failed"]);
                exit;
            }
        }

        if ($stmt->execute()) {
            echo json_encode(["status"=>"success","message"=>"Notification sent"]);
        } else {
            echo json_encode(["status"=>"error","message"=>"Send failed"]);
        }
    } else {
        echo json_encode(["status"=>"error","message"=>"Title and message are required"]);
    }
?>