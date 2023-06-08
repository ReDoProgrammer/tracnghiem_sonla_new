<?php
include_once('../../model/m_config.php');
$configs = json_decode(stripslashes($_POST['configs']), true);

$result = cfUpdateArray($configs);
header("Content-Type: application/json");
echo json_encode($result);
