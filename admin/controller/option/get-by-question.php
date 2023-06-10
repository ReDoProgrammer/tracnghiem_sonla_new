<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_option.php');

$ro = $_GET['ro'];
$question_id = $_GET['id'];
$result = oGet($question_id,$ro);
header("Content-Type: application/json");
echo json_encode($result);