<?php
    include "connect.php";

    $id = $_GET['id'] ?? '';

    if ($id) {
        $stmt = $conn->prepare("SELECT * FROM workouts WHERE id = ?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result()->fetch_array();
        echo json_encode($result ?: ["status" => "error", "message" => "Workout not found"]);
    } else {
        $result = $conn->query("SELECT * FROM workouts");
        $workouts = [];
        while ($row = $result->fetch_array()) {
            $workouts[] = $row;
        }
        echo json_encode($workouts);
    } 
?>