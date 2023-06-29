<?php
include('../../model/m_exam.php');
$id = $_POST['id'];
$result = SetStatistic($id);
header("Content-Type: application/json");
echo json_encode($result);
?>