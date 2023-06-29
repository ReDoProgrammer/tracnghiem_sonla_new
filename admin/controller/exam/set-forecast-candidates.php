<?php
include('../../model/m_exam.php');
$id = $_POST['id'];
$result = SetForeCastCandidates($id);
header("Content-Type: application/json");
echo json_encode($result);
?>