<?php
include('../../model/m_exam_config.php');

//get form input
$exam_id = $_POST['exam_id'];
$topic_id = $_POST['topic_id'];
$percent = $_POST['percent'];
$created_by = $_POST['created_by'];

$result = create($exam_id, $topic_id,$percent,$created_by);
header("Content-Type: application/json");
echo json_encode($result);
?>