<?php
    include "connect.php";

    $title = $_POST['title'] ?? '';
    $description = $_POST['description'] ?? '';
    $calories = $_POST['calories'] ?? '';
    $protein = $_POST['protein'] ?? 0;
    $carbs = $_POST['carbs'] ?? 0;
    $fat = $_POST['fat'] ?? 0;
    $duration_days = $_POST['duration_days'] ?? '';
    $nutritionist_id = $_POST['nutritionist_id'] ?? '';

    if ($title && $calories && $duration_days && $nutritionist_id) {
        $stmt = $conn->prepare("INSERT INTO nutrition_plans (title, description, calories, protein, carbs, fat, duration_days, nutritionist_id) 
                                VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssiiiiii", $title, $description, $calories, $protein, $carbs, $fat, $duration_days, $nutritionist_id);

        if ($stmt->execute()) {
            echo json_encode(["status" => "success", "message" => "Nutrition plan created"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Insert failed"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Missing required fields"]);
    }
?>