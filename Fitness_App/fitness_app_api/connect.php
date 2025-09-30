<?php
    define('HOST', 'localhost');
    define('USER', 'root');
    define('PASSWORD', '');
    define('DB_NAME', 'fitness_app');

    $conn = mysqli_connect(HOST, USER, PASSWORD, DB_NAME) or die('Unable to Connect');

    if($conn) {
        echo "Connection Successful";
    } else {
        echo "Connection Failed";
    }
?>