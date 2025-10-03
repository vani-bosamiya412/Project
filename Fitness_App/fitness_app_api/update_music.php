<?php
    include "connect.php";

    $id = $_POST['id'] ?? '';
    $title = $_POST['title'] ?? '';
    $artist = $_POST['artist'] ?? '';
    $genre = $_POST['genre'] ?? '';
    $duration = $_POST['duration'] ?? '';
    $music_url = $_POST['music_url'] ?? '';

    if ($id) {
        $stmt = $con->prepare("UPDATE music SET title=?, artist=?, genre=?, duration=?, music_url=? WHERE id=?");
        $stmt->bind_param("sssisi", $title, $artist, $genre, $duration, $music_url, $id);

        if ($stmt->execute()) {
            echo json_encode(["status" => "success", "message" => "Music updated"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Update failed"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Music ID required"]);
    }
?>