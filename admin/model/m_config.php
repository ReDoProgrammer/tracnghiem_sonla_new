<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include_once('m_db.php');
include_once('classes/m_message.php');

function cfChangeState($id, $state)
{
    $sql = "UPDATE configs SET cf_value = '" . $state . "' WHERE id = '" . $id . "'";
    $result = mysql_query($sql, dbconnect());

    $msg = new Message();
    if ($result && mysql_affected_rows() > 0) {
        $msg->statusCode = 200;
        $msg->title = "Cập nhật trạng thái thành công!";
        $msg->icon = "success";
    } else {
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->title = "Cập nhật trạng thái thất bại!";
        $msg->content = mysql_error();
    }
    return $msg;
}

function cfUpdateArray($arr)
{
    $msg = new Message();
    foreach ($arr as $item) {
        $sql = "UPDATE configs SET cf_value = '" . $item['cf_value'] . "' WHERE id = '".$item['id']."'";
        $result = mysql_query($sql, dbconnect());
        if (!$result) {
            $msg->icon = "error";
            $msg->statusCode = 500;
            $msg->title = "Cấu hình thất bại";
            $msg->content = mysql_error();
            return $msg;
        }
    }
   
    $msg->icon = "success";
    $msg->statusCode = 200;
    $msg->title = "Cập nhật cấu hình thành công!";
    return $msg;
  
}


function cfList($mod, $fnc)
{
    $sql = "SELECT id,cf_key,cf_value,cf_title FROM configs WHERE cf_mod = '" . $mod . "' AND cf_fnc='" . $fnc . "'";
    $result = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($result && mysql_num_rows($result) > 0) {
        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Load danh sách cấu hình theo module thành công!";
        $msg->statusCode = 200;
        $msg->content = $arr;
    } else {
        $msg->icon = "error";
        $msg->title = "Load danh sách cấu hình theo module thất bại!";
        $msg->statusCode = 500;
        $msg->content = mysql_error();
    }
    return $msg;
}

function cfDetail($key, $mod, $fnc)
{
    $sql = "SELECT cf_value FROM configs WHERE cf_key = '" . $key . "' AND cf_mod = '" . $mod . "' AND cf_fnc='" . $fnc . "'";
    $result = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($result) {
        if (mysql_num_rows($result)) {
            $msg->statusCode = 200;
            $msg->icon = "success";
            $msg->title = "Lấy thông tin cấu hình thành công!";
            $msg->content = mysql_fetch_array($result);
        } else {
            $msg->statusCode = 404;
            $msg->icon = "error";
            $msg->title = "NOT FOUND!";
            $msg->content = "Không tìm thấy thông tin cấu hình";
        }
    } else {
        $msg->statusCode = 500;
        $msg->title = "Lỗi get config";
        $msg->icon = "error";
        $msg->content = mysql_error();
    }
    return $msg;
}
