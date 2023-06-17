<?php
    include('../../model/m_db.php');
    include('../../model/m_topic.php');
    $examId = $_GET['examId'];
    $topics = ExamConfigs($examId);
    header("Content-Type: application/json");
    echo json_encode($topics);
?>