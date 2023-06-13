<?php
include_once('../../model/m_option.php');

$question_id = $_GET['question_id'];

$result = oGetOptionsByQuestion($question_id);

header("Content-Type: application/json");
echo json_encode($result);
