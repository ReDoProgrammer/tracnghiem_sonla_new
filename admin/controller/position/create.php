<?php
include('../../model/m_position.php');

$name = $_POST['name'];
$created_by = $_POST['created_by'];

$result = create($name,$created_by);
header("Content-Type: application/json");
echo json_encode($result);
