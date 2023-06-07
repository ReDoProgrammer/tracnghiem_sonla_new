<?php
include('../../model/m_position.php');

$search = $_GET['search'];
$result = read($search);
header("Content-Type: application/json");
echo json_encode($result);
