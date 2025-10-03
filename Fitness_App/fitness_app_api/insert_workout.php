<?php
    include "connect.php";

    $title = $_POST['title'] ?? '';
    $description = $_POST['description'] ?? '';
    $category = $_POST['category'] ?? '';
    $difficulty = $_POST['difficulty'] ?? '';
    $duration = $_POST['duration'] ?? '';
    $trainer_id = $_POST['trainer_id'] ?? '';
    $video_url = $_POST['video_url'] ?? '';

    if ($title && $category && $difficulty && $duration && $trainer_id) {
        $stmt = $con->prepare("INSERT INTO workouts (title, description, category, difficulty, duration, trainer_id, video_url) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssiss", $title, $description, $category, $difficulty, $duration, $trainer_id, $video_url);
        if ($stmt->execute()) {
            echo json_encode(["status" => "success", "message" => "Workout created"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Insert failed"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Missing required fields"]);
    }
?>