<?php

/**
 * @author ReDo
 * @copyright 2023
 */


 include('../../model/m_location.php');

$pws = LoadProvinces();
header("Content-Type: application/json");
echo json_encode($pws);
