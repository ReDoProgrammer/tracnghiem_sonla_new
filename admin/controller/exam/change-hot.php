<?php
include('../../model/m_exam.php');
$id = $_POST['id'];
$result = change_hot($id);
header("Content-Type: application/json");
echo json_encode($result);
?>