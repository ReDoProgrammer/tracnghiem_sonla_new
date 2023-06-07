<?php
include('../../model/m_db.php');
include('../../model/m_option.php');
include('../../model/classes/m_message.php');

//get form input
$id = $_POST['id'];
$obj = new Option();
$result = $obj->delete($id);

$msg = new Message();
if(!$result){
    $msg->icon = 'error';
    $msg->title = 'Xóa đáp án thất bại!';
    $msg->content = $result;
    $msg->statusCode = 500;    
}else{
    $msg->icon = 'success';
    $msg->title = 'Xóa đáp án thành công!';
    $msg->statusCode = 200;
}
header("Content-Type: application/json");
echo json_encode($msg);
