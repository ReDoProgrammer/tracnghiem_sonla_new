<?php
    include('../../model/m_db.php');
    include('../../model/m_topic.php');
    $search = $_GET['search'];
    $pageSize = $_GET['pageSize'];
    $pages = countPages($search,$pageSize);
    header("Content-Type: application/json");
    echo json_encode($pages);
?>