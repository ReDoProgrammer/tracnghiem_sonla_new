<?php
/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_member.php');
$id = $_POST['id'];
$fullname = $_POST['fullname'];
$gender = $_POST['gender'];
$birthdate = $_POST['birthdate'];
$password = $_POST['password'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$province_code = $_POST['province_code'];
$district_code = $_POST['district_code'];
$ward_code = $_POST['ward_code'];
$address = $_POST['address'];
$job_id = $_POST['job_id'];
$position_id = $_POST['position_id'];
$workplace_id = $_POST['workplace_id'];
$working_unit = $_POST['working_unit'];
$avatar = $_FILES['avatar'];

$result = mChangeProfile($id,$fullname,$avatar,$birthdate,$gender,$password,$phone,$email,$province_code,
$district_code,$ward_code,$address,$job_id,$workplace_id,$position_id,$working_unit);
header("Content-Type: application/json");
echo json_encode($result);
?>