<?php
    include('../../model/classes/m_message.php');
    $msg = new Message();

    session_start();
    // session_destroy();
    header("Content-Type: application/json");
  
    


    if(isset($_SESSION['admin'])){
        $msg->statusCode = 200;
        $msg->content = $_SESSION['admin'];
        $msg->title = "Bạn đang đăng nhập với vai trò admin!";
        $msg->icon = "success";
        echo json_encode($msg);
    }else{
        $msg->statusCode = 403;
        $msg->content = "Bạn không có quyền truy cập module này!";
        $msg->title = "Warning!";
        $msg->icon = "warning";
        echo json_encode($msg);
    }
