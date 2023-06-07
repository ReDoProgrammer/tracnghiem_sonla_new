<?php

/**
 * @author ReDo
 * @copyright 2023
 */

 include_once('../../model/m_location.php');
$district_code = $_GET['district_code'];
$wards = LoadWardsByDist($district_code);
header("Content-Type: application/json");
echo json_encode($wards);
