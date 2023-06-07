<?php
    include('../../model/m_exam.php');
    $page = $_GET['page'];
    $search = $_GET['search'];
    $pageSize = $_GET['pageSize'];
    $questions = retrieve($page,$search,$pageSize);
    header("Content-Type: application/json");
    echo json_encode($questions);
?>