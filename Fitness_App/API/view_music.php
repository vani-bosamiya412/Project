<?php

include 'connect.php';

header('Content-Type: application/json; charset=utf-8');

$id = $_GET['id'] ?? '';

$cols = "id, title, artist, genre, duration, music_url, created_at, updated_at";

if ($id > 0) {
    $stmt = $conn->prepare("SELECT $cols FROM music WHERE id = ?");
    if (!$stmt) {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => "DB prepare failed"]);
        exit;
    }
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $music = $result ? $result->fetch_assoc() : null;

    if (!$music) {
        http_response_code(404);
        echo json_encode(["status" => "error", "message" => "Music not found"]);
        exit;
    }
    echo json_encode($music);
    exit;
} else {
    $result = $conn->query("SELECT $cols FROM music");
    if (!$result) {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => "DB query failed"]);
        exit;
    }
    $musicList = [];
    while ($row = $result->fetch_assoc()) {
        $musicList[] = $row;
    }
    echo json_encode($musicList);
    exit;
}
?>