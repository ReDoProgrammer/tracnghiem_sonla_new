<?php
    include('../../model/m_db.php');
    include('../../model/m_topic.php');
    $page = $_GET['page'];
    $search = $_GET['search'];
    $pageSize = $_GET['pageSize'];
    $topics = all($page,$search,$pageSize);
    header("Content-Type: application/json");
    echo json_encode($topics);
?>