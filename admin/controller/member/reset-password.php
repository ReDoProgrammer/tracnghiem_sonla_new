<?php
include_once('../../model/m_member.php');

$id = $_POST['id'];
$default_password = $_POST['default_password'];

$result = reset_password($id,$default_password);
header("Content-Type: application/json");
echo json_encode($result);