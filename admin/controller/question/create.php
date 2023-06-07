<?php
include('../../model/m_db.php');
include('../../model/m_question.php');

//get form input
$title = $_POST['title'];
$options = $_POST['options'];
$topic_id = $_POST['topic_id'];
$created_by = $_POST['created_by'];

$result = create($title,$options,$topic_id,$created_by);
header("Content-Type: application/json");
echo json_encode($result);
?>