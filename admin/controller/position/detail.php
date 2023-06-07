<?php
include('../../model/m_position.php');

$id = $_GET['id'];
$result = detail($id);
header("Content-Type: application/json");
echo json_encode($result);
