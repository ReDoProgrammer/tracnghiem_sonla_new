<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_exam.php');
$check = HasHot();
header("Content-Type: application/json");
echo json_encode($check);
