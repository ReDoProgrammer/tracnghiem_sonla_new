<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_member.php');
$email = $_GET['email'];
$user_id = $_GET['user_id'];
$count = CheckDuplicateEmail($email,$user_id);
header("Content-Type: application/json");
echo json_encode($count);