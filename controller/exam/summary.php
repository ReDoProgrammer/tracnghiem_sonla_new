<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_exam.php');
$id = $_GET["id"];
$exam = ExDetail($id);
header("Content-Type: application/json");
echo json_encode($exam);
