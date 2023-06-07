<?php
include('../../model/m_workplace.php');

$id = $_POST['id'];
$result = delete($id);
header("Content-Type: application/json");
echo json_encode($result);
