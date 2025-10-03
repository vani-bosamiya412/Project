<?php
    include "connect.php";

    $user_id = $_POST['user_id'] ?? '';
    $steps = $_POST['steps'] ?? 0;
    $distance = $_POST['distance'] ?? 0;
    $duration = $_POST['duration'] ?? 0; 
    $calories = $_POST['calories'] ?? 0;
    $activity_date = $_POST['activity_date'] ?? date("Y-m-d");

    if ($user_id) {
        $stmt = $conn->prepare("INSERT INTO activities (user_id, steps, distance, duration, calories, activity_date) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("iidiis", $user_id, $steps, $distance, $duration, $calories, $activity_date);

        if ($stmt->execute()) {
            echo json_encode(["status" => "success", "message" => "Activity logged successfully"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Failed to log activity"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "User ID is required"]);
    }
?>