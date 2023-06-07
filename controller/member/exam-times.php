<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_exam_result.php');

$exam_id = $_GET['exam_id'];
$result =erGetTimes($exam_id);
header("Content-Type: application/json");
echo json_encode($result);