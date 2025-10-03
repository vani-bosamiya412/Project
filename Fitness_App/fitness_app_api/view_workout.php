<?php
    include "connect.php";

    $id = $_GET['id'] ?? '';

    if ($id) {
        $stmt = $con->prepare("SELECT * FROM workouts WHERE id = ?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result()->fetch_assoc();
        echo json_encode($result ?: ["status" => "error", "message" => "Workout not found"]);
    } else {
        $result = $con->query("SELECT * FROM workouts");
        $workouts = [];
        while ($row = $result->fetch_assoc()) {
            $workouts[] = $row;
        }
        echo json_encode($workouts);
    } 
?>