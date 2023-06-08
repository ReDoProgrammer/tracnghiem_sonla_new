<?php
include_once('../../model/m_config.php');
$mod = $_GET['mod'];
$fnc = $_GET['fnc'];

$result = cfList($mod, $fnc);
header("Content-Type: application/json");
echo json_encode($result);
