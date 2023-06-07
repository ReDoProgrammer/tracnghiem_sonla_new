<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_exam.php');
$exams = Top10Exams();
header("Content-Type: application/json");
echo json_encode($exams);
