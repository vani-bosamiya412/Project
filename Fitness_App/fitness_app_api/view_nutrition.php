<?php
    include "connect.php";

    $id = $_GET['id'] ?? '';

    if ($id) {
        $stmt = $conn->prepare("SELECT * FROM nutrition_plans WHERE id = ?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result()->fetch_assoc();
        echo json_encode($result ?: ["status" => "error", "message" => "Nutrition plan not found"]);
    } else {
        $result = $conn->query("SELECT * FROM nutrition_plans");
        $plans = [];
        while ($row = $result->fetch_assoc()) {
            $plans[] = $row;
        }
        echo json_encode($plans);
    }
?>
