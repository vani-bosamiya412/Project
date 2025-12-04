<?php
include "connect.php";

$user_id = $_GET['user_id'] ?? '';

if (!$user_id) {
    echo json_encode(["status" => "error", "message" => "user_id required"]);
    exit;
}

$stmt = $conn->prepare("
    SELECT steps, calories, duration, activity_date
    FROM activities
    WHERE user_id = ?
    ORDER BY activity_date ASC
");
$stmt->bind_param("i", $user_id);
$stmt->execute();

$result = $stmt->get_result();
$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);
?>