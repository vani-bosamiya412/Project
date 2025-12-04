<?php
include "connect.php";

$user_id = $_POST['user_id'] ?? '';
$steps = $_POST['steps'] ?? 0;
$distance = $_POST['distance'] ?? 0;
$duration = $_POST['duration'] ?? 0;
$calories = $_POST['calories'] ?? 0;
$activity_date = $_POST['activity_date'] ?? date("Y-m-d");

if ($user_id) {
    $stmt = $conn->prepare("
        INSERT INTO activities (user_id, steps, distance, duration, calories, activity_date)
        VALUES (?, ?, ?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE
            steps = VALUES(steps),
            distance = VALUES(distance),
            duration = VALUES(duration),
            calories = VALUES(calories)
    ");

    $stmt->bind_param("iidids",
        $user_id,
        $steps,
        $distance,
        $duration,
        $calories,
        $activity_date
    );

    if ($stmt->execute()) {
        $id = $conn->insert_id;
        if ($id == 0) {
            $q = $conn->prepare("SELECT id FROM activities WHERE user_id=? AND activity_date=?");
            $q->bind_param("is", $user_id, $activity_date);
            $q->execute();
            $id = $q->get_result()->fetch_assoc()['id'] ?? 0;
        }

        echo json_encode([
            "status" => "success",
            "message" => "Activity saved",
            "id" => $id
        ]);

    } else {
        echo json_encode(["status" => "error", "message" => "Failed to save"]);
    }

} else {
    echo json_encode(["status" => "error", "message" => "User ID required"]);
}
?>
