<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_exam.php');
$result = Top10Units();
header("Content-Type: application/json");
echo json_encode($result);
