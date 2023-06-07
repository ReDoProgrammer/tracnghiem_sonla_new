<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_workplace.php');

$province_code = $_GET['province_code'];

$count = retrieve($province_code);
header("Content-Type: application/json");
echo json_encode($count);