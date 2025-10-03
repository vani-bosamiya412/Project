<?php
    include "connect.php";

    $title = $_POST['title'] ?? '';
    $artist = $_POST['artist'] ?? '';
    $genre = $_POST['genre'] ?? '';
    $duration = $_POST['duration'] ?? '';
    $music_url = $_POST['music_url'] ?? '';

    if ($title && $artist && $duration && $music_url) {
        $stmt = $con->prepare("INSERT INTO music (title, artist, genre, duration, music_url) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssis", $title, $artist, $genre, $duration, $music_url);

        if ($stmt->execute()) {
            echo json_encode(["status" => "success", "message" => "Music added"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Insert failed"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Missing required fields"]);
    }
?>
