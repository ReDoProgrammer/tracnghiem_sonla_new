<?php
include('../../model/m_exam.php');
$id = $_POST['id'];
$is_hot = $_POST['is_hot'];
$result = change_hot($id,$is_hot);
header("Content-Type: application/json");
echo json_encode($result);
?>