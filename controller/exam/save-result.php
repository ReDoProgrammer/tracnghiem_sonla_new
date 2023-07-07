<?php

/**
 * @author ReDo
 * @copyright 2023
 * Load danh sách câu hỏi từ các config của đề thi
 */

include('../../model/m_exam.php');

$exam_id = $_POST['exam_id'];
$result = $_POST['result'];
$spent_duration = $_POST['spent_duration'];
$times = $_POST['times'];
$exam_date = $_POST['exam_date'];
$is_forecast = $_POST['isForeCast'];$forecast_candidates = $_POST['forecast_candidates'];
$saved = save($exam_id,$result,$times,$spent_duration,$exam_date,$forecast_candidates);
header("Content-Type: application/json");
echo json_encode($saved);