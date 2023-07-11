<?php
    include('../../model/m_exam.php');

    $exams = $_GET['exams'];
    $workplaces = $_GET['workplaces'];
    $page = $_GET['page'];
    $pageSize = $_GET['pageSize'];
    $max = $_GET['max'];
    $begin = $_GET['begin'];
    $end = $_GET['end'];
    $result = LoadResultByExamsAndWorkplaces($exams,$workplaces,$page,$pageSize,$max,$begin,$end);
    header("Content-Type: application/json");
    echo json_encode($result);
?>