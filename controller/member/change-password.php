<?php
/**
 * @author ReDo
 * @copyright 2023
 */
include('../../model/m_member.php');

$user_id = $_POST['user_id'];
$current_password = $_POST['currentPassword'];
$new_password = $_POST['newPassword'];

$result = mChangePassword($user_id,$current_password,$new_password);
header("Content-Type: application/json");
echo json_encode($result);
?>