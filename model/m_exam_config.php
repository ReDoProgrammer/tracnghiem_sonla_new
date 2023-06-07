<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include_once('m_db.php');
include_once('classes/m_message.php');

function GetConfigs($exam_id)
{
    $sql = "SELECT topic_id,percent FROM exam_configs WHERE exam_id='".$exam_id."'";
    $configs = mysql_query($sql, dbconnect());
    $msg = new Message();
    if($configs){
        $result = array();
        while ($local = mysql_fetch_array($configs)) {
            $result[] = $local;
        }
        $msg->icon = 'success';
        $msg->title = "Load cấu hình bài thi thành công!";
        $msg->statusCode = 200;
        $msg->content = $result;
    }else{
        $msg->icon = 'error';
        $msg->title = "Load cấu hình bài thi thất bại!";
        $msg->statusCode = 500;
        $msg->content = mysql_error();
    }
   return $msg;
}
