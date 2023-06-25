<?php
    /**
 * @author ReDo
 * @copyright 2023
 */

    include('../../model/m_member.php');

    $user_id = $_POST["user_id"];
    $fullname = $_POST["fullname"];
    $birthdate = $_POST["birthdate"];
    $gender = $_POST["gender"];
    $phone = $_POST["phone"];
    $email = $_POST["email"];
    $province_code = $_POST["province_code"];
    $district_code = $_POST["district_code"];
    $ward_code = $_POST["ward_code"];
    $address = $_POST["address"];
    $job_id = $_POST["job_id"];
    $workplace_id = $_POST["workplace_id"];
    $position_id = $_POST["position_id"];
    $working_unit = $_POST["working_unit"];

    $result = mChangeProfile($user_id,$fullname,$birthdate,$gender,$phone,$email,$province_code,
    $district_code,$ward_code,$address,$job_id,$workplace_id,$position_id,$working_unit);
    header("Content-Type: application/json");
    echo json_encode($result);
?>
