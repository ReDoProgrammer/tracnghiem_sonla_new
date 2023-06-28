<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_statistic.php');

$province_code = $_GET['province_code'];
$result = statProvince($province_code);
header("Content-Type: application/json");
echo json_encode($result);