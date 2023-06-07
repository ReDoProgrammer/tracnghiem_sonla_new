<?php
include('../../model/m_position.php');

$id = $_POST['id'];
$name = $_POST['name'];
$created_by = $_POST['created_by'];

$result = update($id,$name,$updated_by);
header("Content-Type: application/json");
echo json_encode($result);
