<?php
    include('../../model/classes/m_message.php');
    session_start();
    $profile = (array)$_SESSION['profile'];
    $msg = new Message();
    $msg->statusCode=200;
    $msg->title = "Lấy thông tin tài khoản thành công!";
    $msg->icon = "success";
    $msg->content  = $profile;
    header("Content-Type: application/json");
    echo json_encode($msg);
?>