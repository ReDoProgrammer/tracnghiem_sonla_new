<?php
include('../../model/m_member.php');
require_once ('../../system/phpmailer/class.phpmailer.php');

$username = $_POST['username'];
$password = $_POST['password'];

$result = login($username,$password);

header("Content-Type: application/json");
echo json_encode($result);
