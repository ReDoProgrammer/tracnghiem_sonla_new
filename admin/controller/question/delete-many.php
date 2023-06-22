<?php
include('../../model/m_question.php');

//get form input
$ids = $_POST['ids'];
$result = qDeleteMany($ids);
header("Content-Type: application/json");
echo json_encode($result);
