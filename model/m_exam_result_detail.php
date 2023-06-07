<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include_once('m_db.php');
include_once('classes/m_message.php');

function erdSave($exam_result_id,$question_id,$question_answer,$option_id,$created_by)
{

    $sql = "INSERT INTO exam_result_details(exam_result_id,question_id,question_answer,option_id,created_by)
            VALUES('".$exam_result_id."','".$question_id."','".$question_answer."','".$option_id."','".$created_by."')";
    $result = mysql_query($sql,dbconnect());
    $msg= new Message();
    if($result && mysql_affected_rows()>0){      
        $msg->icon = "success";
        $msg->title = "Insert chi tiết kết quả bài thi thành công!";
        $msg->statusCode = 201;
    }else{
        $msg->icon = "error";
        $msg->title = "Insert chi tiết kết quả bài thi thất bại!";
        $msg->statusCode = 500;
        $msg->content = mysql_error();
    }
    return $msg;
}

