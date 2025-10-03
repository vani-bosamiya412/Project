<?php
    include "connect.php";

    $id = $_POST['id'] ?? '';
    $steps = $_POST['steps'] ?? 0;
    $distance = $_POST['distance'] ?? 0;
    $duration = $_POST['duration'] ?? 0;
    $calories = $_POST['calories'] ?? 0;
    $activity_date = $_POST['activity_date'] ?? '';

    if ($id) {
        $stmt = $conn->prepare("UPDATE activities SET steps=?, distance=?, duration=?, calories=?, activity_date=? WHERE id=?");
        $stmt->bind_param("idiisi", $steps, $distance, $duration, $calories, $activity_date, $id);

        if ($stmt->execute()) {
            echo json_encode(["status" => "success", "message" => "Activity updated"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Update failed"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Activity ID required"]);
    }
?>
