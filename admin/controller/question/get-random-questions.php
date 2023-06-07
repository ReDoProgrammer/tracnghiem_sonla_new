<?php
    include('../../model/m_db.php');
    include('../../model/m_question.php');
    $topic_id = $_GET['topic_id'];   
    $limit = $_GET['limit'];   
    $questions = getRandomQuestionsLimited($topic_id,$limit);
    header("Content-Type: application/json");
    echo json_encode($questions);
?>