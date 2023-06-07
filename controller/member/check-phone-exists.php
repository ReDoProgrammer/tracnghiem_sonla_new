<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_member.php');
$phone = $_GET['phone'];
$count = CheckPhoneExist($phone);
header("Content-Type: application/json");
echo json_encode($count);