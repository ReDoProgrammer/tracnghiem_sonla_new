<?php
include('../../model/m_workplace.php');

$id = $_POST['id'];
$name = $_POST['name'];
$phone = $_POST['phone'];
$email = $_POST['email'];
$fax = $_POST['fax'];
$province_code = $_POST['province_code'];
$district_code = $_POST['district_code'];
$ward_code = $_POST['ward_code'];
$address = $_POST['address'];
$updated_by = $_POST['updated_by'];

$result = update($id,$name, $phone, $email, $province_code, $district_code, $ward_code, $address, $fax, $updated_by);
header("Content-Type: application/json");
echo json_encode($result);
