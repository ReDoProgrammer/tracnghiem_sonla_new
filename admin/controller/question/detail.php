<?php
    include('../../model/m_db.php');
    include('../../model/m_question.php');
    $id = $_GET['id'];   
    $question = getQuestion($id);
    header("Content-Type: application/json");
    echo json_encode($question);
?>