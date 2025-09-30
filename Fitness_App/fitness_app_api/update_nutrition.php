<?php
    include "connect.php";

    $id = $_POST['id'] ?? '';
    $title = $_POST['title'] ?? '';
    $description = $_POST['description'] ?? '';
    $calories = $_POST['calories'] ?? '';
    $protein = $_POST['protein'] ?? 0;
    $carbs = $_POST['carbs'] ?? 0;
    $fat = $_POST['fat'] ?? 0;
    $duration_days = $_POST['duration_days'] ?? '';
    $nutritionist_id = $_POST['nutritionist_id'] ?? '';

    if ($id) {
        $stmt = $conn->prepare("UPDATE nutrition_plans SET title=?, description=?, calories=?, protein=?, carbs=?, fat=?, duration_days=?, nutritionist_id=? WHERE id=?");
        $stmt->bind_param("ssiiiiiii", $title, $description, $calories, $protein, $carbs, $fat, $duration_days, $nutritionist_id, $id);

        if ($stmt->execute()) {
            echo json_encode(["status" => "success", "message" => "Nutrition plan updated"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Update failed"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Nutrition plan ID required"]);
    }
?>
