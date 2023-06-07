<?php
include('../../model/m_db.php');
include('../../model/m_topic.php');

//get form input
$id = $_POST['id'];
$name = $_POST['name'];
$updated_by = $_POST['updated_by'];

$result = update($id,$name,$updated_by);
header("Content-Type: application/json");
echo json_encode($result);
