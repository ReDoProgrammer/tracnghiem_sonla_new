<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_db.php');
include('../../model/m_member.php');
$fullname = $_POST['fullname'];
$username = $_POST['username'];
$password = $_POST['password'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$gender = $_POST['gender'];
$birthdate = $_POST['birthdate'];
$province_code = $_POST['province_code'];
$district_code = $_POST['district_code'];
$ward_code = $_POST['ward_code'];
$address = $_POST['address'];
$job_id = $_POST['job_id'];
$position_id = $_POST['position_id'];
$workplace_id = $_POST['workplace_id'];
$avatar = $_FILES['avatar'];

//get config values

$cfBirthdate = $_POST['cfBirthdate'];
$cfGender = $_POST['cfGender'];
$cfAddress = $_POST['cfAddress'];
$cfJob = $_POST['cfJob'];
$cfPosition = $_POST['cfPosition'];
$cfWorkPlace = $_POST['cfWorkPlace'];

$result =Register($fullname,$avatar,$username,$password,$email,$phone,$gender,$birthdate,
$province_code,$district_code,$ward_code,$address,$job_id,$position_id,$workplace_id,
$cfBirthdate,$cfGender,$cfAddress,$cfJob,$cfPosition,$cfWorkPlace);
header("Content-Type: application/json");
echo json_encode($result);
