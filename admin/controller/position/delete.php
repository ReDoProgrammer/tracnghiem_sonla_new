<?php
include('../../model/m_position.php');

$id = $_POST['id'];

$result = delpos($id);
header("Content-Type: application/json");
echo json_encode($result);