<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_db.php');
include('../../model/m_location.php');
$provinces = LoadProvinces();
header("Content-Type: application/json");
echo json_encode($provinces);
