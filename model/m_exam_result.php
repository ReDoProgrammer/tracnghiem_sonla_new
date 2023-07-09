<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include_once('m_db.php');
include_once('m_exam.php');
include_once('classes/m_message.php');


function erGetTimes($exam_id){
    session_start();
    $p =  (array)$_SESSION['profile'];
    $sql = "SELECT * FROM exam_results WHERE member_id='".$p['id']."' AND exam_id = '".$exam_id."'";

    $result = mysql_query($sql,dbconnect());
    
    $msg = new Message();
    if($result){
        $count = mysql_num_rows($result);

        $msg->icon = "success";
        $msg->statusCode = 200;
        $msg->title = "Lấy thông tin lần thi thành công!";
        $msg->content = $count;
    }else{
        $msg->icon = "error";
        $msg->title = "Lấy thông tin lần thi thất bại";
        $msg->content = "Lỗi: ".mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}

function erSave($exam_id, $member_id,$times,$spent_duration,$exam_date,$forecast_candidates)
{
    $sql = "INSERT INTO exam_results(member_id,exam_id,times,spent_duration,started_at,forecast_candidates,created_by)
            VALUES('".$member_id."','".$exam_id."','".$times."','".$spent_duration."','".$exam_date."','".$forecast_candidates."','".$member_id."')";
    
$result = mysql_query($sql,dbconnect());
    $msg = new Message();
    if($result && mysql_affected_rows()>0){
        $insertedId = mysql_insert_id();
        $msg->icon = "success";
        $msg->title = "Insert thông tin kết quả bài thi thành công!";
        $msg->statusCode = 201;
        $msg->content = $insertedId;
    }else{
        $msg->icon = "error";
        $msg->title = "Insert thông tin kết quả bài thi thất bại!";
        $msg->statusCode = 500;
        $msg->content = mysql_error();
    }
    return $msg;
}

