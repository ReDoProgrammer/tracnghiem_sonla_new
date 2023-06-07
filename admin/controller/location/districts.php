<?php

/**
 * @author ReDo
 * @copyright 2023
 */

 include_once('../../model/m_location.php');
$province_code = $_GET['province_code'];
$districts = LoadDistrictsByPro($province_code);
header("Content-Type: application/json");
echo json_encode($districts);
