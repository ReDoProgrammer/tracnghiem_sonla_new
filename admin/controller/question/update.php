<?php
include('../../model/m_question.php');

//get form input
$id = $_POST['id'];
$title = $_POST['title'];
$options = $_POST['options'];
$topic_id = $_POST['topic_id'];
$updated_by = $_POST['updated_by'];

$result = update($id,$title,$options,$topic_id,$updated_by);
header("Content-Type: application/json");
echo json_encode($result);
?>