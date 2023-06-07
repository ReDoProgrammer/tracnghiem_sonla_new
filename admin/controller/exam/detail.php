<?php
    include('../../model/m_exam.php');
    $id = $_GET['id'];   
    $topic = detail($id);
    header("Content-Type: application/json");
    echo json_encode($topic);
?>