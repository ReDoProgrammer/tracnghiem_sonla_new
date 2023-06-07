<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_member.php');

$username_or_email = $_POST['username_or_email'];
$login_password = $_POST['login_password'];
$ip_address = $_POST['ip_address'];
$result =Login($username_or_email,$login_password,$ip_address);
header("Content-Type: application/json");
echo json_encode($result);
