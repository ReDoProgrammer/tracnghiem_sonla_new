<?php
include('../../model/m_db.php');
include('../../model/m_option.php');

$question_id = $_GET['question_id'];

$obj = new Option();
$result = $obj->get_options_by_question($question_id);

header("Content-Type: application/json");
echo json_encode($result);
