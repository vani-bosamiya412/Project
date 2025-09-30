<?php
    include "connect.php";

    $id = $_POST['id'] ?? '';
    $title = $_POST['title'] ?? '';
    $description = $_POST['description'] ?? '';
    $category = $_POST['category'] ?? '';
    $difficulty = $_POST['difficulty'] ?? '';
    $duration = $_POST['duration'] ?? '';
    $trainer_id = $_POST['trainer_id'] ?? '';
    $video_url = $_POST['video_url'] ?? '';

    if ($id) {
        $stmt = $conn->prepare("UPDATE workouts SET title=?, description=?, category=?, difficulty=?, duration=?, trainer_id=?, video_url=? WHERE id=?");
        $stmt->bind_param("ssssissi", $title, $description, $category, $difficulty, $duration, $trainer_id, $video_url, $id);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "Workout updated successfully"]);
        } else {
            echo json_encode(["success" => false, "message" => "Error updating workout: " . $stmt->error]);
        }    
    } else {
        echo json_encode(["status" => "error", "message" => "Workout ID required"]);
    }
?>