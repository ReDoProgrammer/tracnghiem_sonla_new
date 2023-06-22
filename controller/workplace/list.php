<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_workplace.php');

$wps = retrieve();
header("Content-Type: application/json");
echo json_encode($wps);