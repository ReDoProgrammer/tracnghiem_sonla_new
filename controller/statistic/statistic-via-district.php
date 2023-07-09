<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_statistic.php');

$code = $_GET['code'];
$result = statDistrict($code);
header("Content-Type: application/json");
echo json_encode($result);