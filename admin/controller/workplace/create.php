<?php
include('../../model/m_workplace.php');

$name = $_POST['name'];
$phone = $_POST['phone'];
$email = $_POST['email'];
$fax = $_POST['fax'];
$province_code = $_POST['province_code'];
$district_code = $_POST['district_code'];
$ward_code = $_POST['ward_code'];
$address = $_POST['address'];
$created_by = $_POST['created_by'];

$result = create($name, $phone, $email, $province_code, $district_code, $ward_code, $address, $fax, $created_by);
header("Content-Type: application/json");
echo json_encode($result);
