<?php
    include('../../model/m_db.php');
    include('../../model/m_question.php');
    $topic_id = $_GET['topic_id'];   
    $questions = getQuestionsByTopic($topic_id);
    header("Content-Type: application/json");
    echo json_encode($questions);
?>