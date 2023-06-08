<?php
include_once('../../model/m_config.php');

$id = $_POST['id'];
$state = $_POST['state'];

$result = cfChangeState($id,$state);
header("Content-Type: application/json");
echo json_encode($result);
