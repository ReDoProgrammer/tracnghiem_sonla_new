<?php

/**
 * @author ReDo
 * @copyright 2023
 */

 include_once('m_db.php');
include_once('classes/m_message.php');

function create($exam_id, $topic_id, $percent, $created_by)
{
    $sql = "DELETE FROM exam_configs WHERE exam_id = '".$exam_id."' AND topic_id = '".$topic_id."'";
    $msg = new Message();
    $result = mysql_query($sql,dbconnect());
    if($result){
        $result = mysql_query("INSERT INTO exam_configs(exam_id,topic_id,percent,created_by) 
        VALUES(" . $exam_id . "," . $topic_id . "," . $percent . "," . $created_by . ")", dbconnect());
       
        if ($result && mysql_affected_rows()>0) {
            $msg->statusCode = 201;
            $msg->title = "Cấu hình đề thi thành công!";
            $msg->icon = "success";
        } else {
            $msg->statusCode = 500;
            $msg->title = "Cấu hình đề thi thất bại!";
            $msg->icon = "error";
            $msg->content = "Lỗi: ".mysql_error();
        }
    }else{
        $msg->statusCode = 500;
        $msg->title = "Cấu hình đề thi thất bại!";
        $msg->icon = "error";
        $msg->content = "Lỗi: ".mysql_error();
    }
   
    return $msg;
}

function update($exam_id, $topic_id, $percent, $updated_by)
{
    $sql = "UPDATE exam_configs
            SET percent = " . $percent . ",
                updated_at = CURRENT_TIMESTAMP(),
                updated_by = " . $updated_by . "
            WHERE exam_id = " . $exam_id . "
            AND topic_id = " . $topic_id;
    $result = mysql_query($sql, dbconnect());

    $msg= new Message();
    
    if ($result && mysql_affected_rows()>0) {
        $msg->statusCode = 200;
        $msg->title = "Cập nhật cấu hình đề thi thành công!";
        $msg->icon = "success";
    } else {
        $msg->statusCode = 500;
        $msg->title = "Cập nhật cấu hình đề thi thất bại!";
        $msg->icon = "error";
        $msg->content = "Lỗi: ".mysql_error();
    }
    return $msg;
}

function retrieve($exam_id)
{
    $sql = "SELECT t.id as topic_id,
    t.name AS topic_name,
    ec.percent,
    COUNT(q.id) as count_questions
    FROM exam_configs ec
    INNER JOIN topics t on ec.topic_id = t.id
    INNER JOIN questions q on t.id = q.topic_id
    WHERE ec.exam_id = " . $exam_id . "
    GROUP BY topic_id,topic_name,percent";

    $local_list = mysql_query($sql, dbconnect());   
    $msg = new Message();
    if($local_list){
        $result = array();
        while ($local = mysql_fetch_array($local_list)) {
            $result[] = $local;
        }
        $msg->statusCode =200;
        $msg->icon = "success";
        $msg->title = "Load cấu hình bài thi thành công!";
        $msg->content = $result;
    }else{
        $msg->statusCode =500;
        $msg->icon = "error";
        $msg->title = "Load cấu hình bài thi thất bại!";
        $msg->content = "Lỗi: ".mysql_error();
    }
  
    return $msg;
}
