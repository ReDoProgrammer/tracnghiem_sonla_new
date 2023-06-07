<?php
    include('../../model/m_workplace.php');
    $page = $_GET['page'];
    $search = $_GET['search'];
    $pageSize = $_GET['pageSize'];

    $result = retrieve($page,$search,$pageSize);
    header("Content-Type: application/json");
    echo json_encode($result);
?>