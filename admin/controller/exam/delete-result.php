<?php
include('../../model/m_exam.php');

//get form input
$result_id = $_POST['result_id'];
$result = delete_result($result_id);
header("Content-Type: application/json");
echo json_encode($result);
