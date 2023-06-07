<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_config.php');
$key = $_GET['key'];
$mod = $_GET['mod'];
$fnc = $_GET['fnc'];
$result = cfDetail($key,$mod,$fnc);
header("Content-Type: application/json");
echo json_encode($result);
