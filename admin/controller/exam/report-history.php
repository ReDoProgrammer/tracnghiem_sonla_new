<?php
    include('../../model/m_exam.php');
    $page = $_GET['page'];
    $search = $_GET['search'];
    $pageSize = $_GET['pageSize'];
    $exams = $_GET['exams'];
    $workplaces = $_GET['workplaces'];
    $result = History($page,$search,$pageSize,$workplaces,$exams);

    header("Content-Type: application/json");
    echo json_encode($result);
?>