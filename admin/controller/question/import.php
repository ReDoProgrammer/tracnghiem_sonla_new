<?php
include('../../model/m_question.php');

//get form input
$questions = $_POST['questions'];
$topic_id = $_POST['topic_id'];
$created_by = $_POST['created_by'];
$result = qImport($topic_id,$questions,$created_by);
header("Content-Type: application/json");
echo json_encode($result);
?>