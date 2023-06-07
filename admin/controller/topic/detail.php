<?php
    include('../../model/m_db.php');
    include('../../model/m_topic.php');
    $id = $_GET['id'];   
    $topic = detail($id);
    header("Content-Type: application/json");
    echo json_encode($topic);
?>