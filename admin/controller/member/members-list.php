<?php
include_once('../../model/m_member.php');

$search = $_GET['search'];
$page = $_GET['page'];
$pageSize = $_GET['pageSize'];
$wp = $_GET['wp'];

$result = mbList($wp,$search, $page, $pageSize);

header("Content-Type: application/json");
echo json_encode($result);