<?php
    include('../../model/m_exam.php');
    $exams = $_GET['exams'];
    $workplaces = $_GET['workplaces'];
    
    $result = LoadResultByExamsAndWorkplaces($exam,$workplaces);
    header("Content-Type: application/json");
    echo json_encode($result);
?>