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
$saved = save($exam_id,$result,$times,$spent_duration);
header("Content-Type: application/json");
echo json_encode($saved);