<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_member.php');
$email = $_GET['email'];
$count = CheckEmailExists($email);
header("Content-Type: application/json");
echo json_encode($count);