<?php
    include "connect.php";

    $user_id = $_GET['user_id'] ?? '';

    if ($user_id) {
        $stmt = $con->prepare("SELECT * FROM notifications WHERE user_id=? ORDER BY created_at DESC");
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $notifications = [];
        while ($row = $result->fetch_assoc()) {
            $notifications[] = $row;
        }
        echo json_encode($notifications);
    } else {
        // Optional: view all notifications
        $result = $con->query("SELECT * FROM notifications ORDER BY created_at DESC");
        $notifications = [];
        while ($row = $result->fetch_assoc()) {
            $notifications[] = $row;
        }
        echo json_encode($notifications);
    }
?>
