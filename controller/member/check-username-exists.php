<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_member.php');
$username = $_GET['username'];
$count = CheckUsernameExist($username);
header("Content-Type: application/json");
echo json_encode($count);
