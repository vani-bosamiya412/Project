<?php
include "connect.php";

$upload_dir = "uploads/"; 

if (!file_exists($upload_dir)) {
    mkdir($upload_dir, 0777, true);
}

if (isset($_FILES['file'])) {
    $file_name = basename($_FILES['file']['name']);
    $file_tmp = $_FILES['file']['tmp_name'];
    $file_ext = pathinfo($file_name, PATHINFO_EXTENSION);

    $new_name = uniqid() . "." . $file_ext;
    $target_path = $upload_dir . $new_name;

    if (move_uploaded_file($file_tmp, $target_path)) {
        $file_url = "https://prakrutitech.xyz/vani/" . $target_path;
        echo json_encode(["status" => "success", "file_url" => $file_url]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to move uploaded file"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "No file uploaded"]);
}
?>
