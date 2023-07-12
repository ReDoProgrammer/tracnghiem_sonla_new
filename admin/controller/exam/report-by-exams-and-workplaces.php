<?php
    include('../../model/m_exam.php');

    $exams = $_GET['exams'];
    $workplaces = $_GET['workplaces'];
    $page = $_GET['page'];
    $pageSize = $_GET['pageSize'];
    $max = $_GET['max'];
    $begin = $_GET['begin'];
    $end = $_GET['end'];
    $province = $_GET['province'];
    $districts = $_GET['districts'];
    $result = LoadResultByExamsAndWorkplaces($exams,$workplaces,$page,$pageSize,$max,$begin,$end,$province,$districts);
    header("Content-Type: application/json");
    echo json_encode($result);
?>