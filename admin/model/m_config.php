<?php

/**
 * @author ReDo
 * @copyright 2023
 */

 include_once('m_db.php');
 include_once('classes/m_message.php');

function cfList($mod,$fnc){
    $sql = "SELECT cf_key,cf_value FROM configs WHERE cf_mod = '".$mod."' AND cf_fnc='".$fnc."'";
    $result = mysql_query($sql,dbconnect());
    $msg = new Message();
    if($result && mysql_num_rows($result)>0){
        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Lấy thông tin cấu hình thông tin đăng ký thành công!";
        $msg->statusCode = 200;
        $msg->content = $arr;
    }else{
        $msg->icon = "error";
        $msg->title = "Lấy thông tin cấu hình đăng ký thất bại!";
        $msg->statusCode = 500;
        $msg->content = mysql_error();
    }
    return $msg;
}

function cfDetail($key,$mod,$fnc){
    $sql = "SELECT cf_value FROM configs WHERE cf_key = '".$key."' AND cf_mod = '".$mod."' AND cf_fnc='".$fnc."'";
    $result = mysql_query($sql,dbconnect());
    $msg = new Message();
    if($result){
        if(mysql_num_rows($result)){
            $msg->statusCode = 200;
            $msg->icon = "success";
            $msg->title = "Lấy thông tin cấu hình thành công!";
            $msg->content = mysql_fetch_array($result);
        }else{
            $msg->statusCode = 404;
            $msg->icon = "error";
            $msg->title = "NOT FOUND!";
            $msg->content = "Không tìm thấy thông tin cấu hình";
        }
    }else{
        $msg->statusCode = 500;
        $msg->title = "Lỗi get config";
        $msg->icon = "error";
        $msg->content = mysql_error();
    }
    return $msg;
}