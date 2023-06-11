<?php

/**
 * @author ReDo
 * @copyright 2023
 * Load danh sách câu hỏi từ các config của đề thi
 */

include('../../model/m_exam.php');

$page = $_GET["page"];
$pageSize = $_GET["pageSize"];
$result = LoadExams($page,$pageSize);
header("Content-Type: application/json");
echo json_encode($result);
