<?php
include "connect.php";

$id = $_GET['id'] ?? '';
$user_id = $_GET['user_id'] ?? '';

if ($id) {
    // Get single activity
    $stmt = $conn->prepare("SELECT a.*, u.name, u.email FROM activities a JOIN vani_users u ON a.user_id=u.id WHERE a.id=?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_assoc();
    echo json_encode($result ?: ["status" => "error", "message" => "Activity not found"]);
} elseif ($user_id) {
    // Get all activities for a user
    $stmt = $conn->prepare("SELECT a.*, u.name, u.email FROM activities a JOIN vani_users u ON a.user_id=u.id WHERE a.user_id=? ORDER BY activity_date DESC");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $activities = [];
    while ($row = $result->fetch_assoc()) {
        $activities[] = $row;
    }
    echo json_encode($activities);
} else {
    // Get all activities
    $result = $conn->query("SELECT a.*, u.name, u.email FROM activities a JOIN vani_users u ON a.user_id=u.id ORDER BY activity_date DESC");
    $activities = [];
    while ($row = $result->fetch_assoc()) {
        $activities[] = $row;
    }
    echo json_encode($activities);
}
?>