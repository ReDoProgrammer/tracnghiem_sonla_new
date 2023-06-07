<?php
include('../../model/m_exam.php');
$id = $_POST['id'];
$random_options = $_POST['random_options'];
$result = change_random_options($id,$random_options);
header("Content-Type: application/json");
echo json_encode($result);
?>