<?php
include "connect.php";

$id = $_GET['id'] ?? '';
$user_id = $_GET['user_id'] ?? '';

if ($id) {
    // Single activity
    $stmt = $conn->prepare("
        SELECT a.*, u.name, u.email 
        FROM activities a 
        JOIN vani_users u ON a.user_id=u.id 
        WHERE a.id=?
    ");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_assoc();

    echo json_encode($result ?: ["status" => "error", "message" => "Not found"]);

} elseif ($user_id) {
    $stmt = $conn->prepare("
        SELECT steps, distance, duration, calories, activity_date 
        FROM activities 
        WHERE user_id=? 
        ORDER BY activity_date ASC
    ");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    
    $result = $stmt->get_result();
    $activities = [];
    while ($row = $result->fetch_assoc()) {
        $activities[] = $row;
    }
    echo json_encode($activities);

} else {
    // All users' activities (admin)
    $result = $conn->query("
        SELECT a.*, u.name, u.email 
        FROM activities a 
        JOIN vani_users u ON a.user_id=u.id 
        ORDER BY activity_date DESC
    ");

    $activities = [];
    while ($row = $result->fetch_assoc()) {
        $activities[] = $row;
    }
    echo json_encode($activities);
}
?>