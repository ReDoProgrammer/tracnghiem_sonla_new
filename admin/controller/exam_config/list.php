<?php
    include('../../model/m_exam_config.php');
    $exam_id = $_GET['exam_id'];

    $configs = retrieve($exam_id);
    header("Content-Type: application/json");
    echo json_encode($configs);
?>