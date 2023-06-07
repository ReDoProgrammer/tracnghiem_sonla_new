<?php

/**
 * @author ReDo
 * @copyright 2023
 */


include_once('../../model/m_location.php');

$pws = ProvincesWorkplaces();
header("Content-Type: application/json");
echo json_encode("1234");
