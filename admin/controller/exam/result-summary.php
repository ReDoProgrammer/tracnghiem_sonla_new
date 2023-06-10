<?php

/**
 * @author ReDo
 * @copyright 2023
 * Load danh sách câu hỏi từ các config của đề thi
 */

include('../../model/m_exam.php');

$id = $_GET["id"];
$candidate = $_GET["candidate"];

$result = exResultSummary($id,$candidate);

header("Content-Type: application/json");
echo json_encode($result);