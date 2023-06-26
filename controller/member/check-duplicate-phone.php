<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_member.php');
$phone = $_GET['phone'];
$user_id = $_GET['user_id'];
$count = CheckDuplicatePhone($phone,$user_id);
header("Content-Type: application/json");
echo json_encode($count);