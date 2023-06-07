<?php
include('../../model/m_db.php');
include('../../model/m_topic.php');

//get form input
$id = $_POST['id'];
$result = delete($id);
header("Content-Type: application/json");
echo json_encode($result);
