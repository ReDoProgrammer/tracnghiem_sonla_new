<?php
    include('../../model/m_db.php');
    include('../../model/m_question.php');
    $page = $_GET['page'];
    $topic = $_GET['topic'];
    $search = $_GET['search'];
    $pageSize = $_GET['pageSize'];
    $questions = qGet($topic,$page,$search,$pageSize);
    header("Content-Type: application/json");
    echo json_encode($questions);
?>