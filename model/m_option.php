<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include_once('m_db.php');
include_once('m_exam.php');
include_once('classes/m_message.php');


function get($question_id, $random_options)
{


    $sql = "SELECT id,content,correct FROM options WHERE question_id = '" . $question_id . "'";
    if ($random_options == 1) {
        $sql .= "  ORDER BY RAND()";
    }else{
        $sql.=" ORDER BY id";
    }

    $options = mysql_query($sql, dbconnect());

    $msg = new Message();
    if ($options) {
        $result = array();
        while ($local = mysql_fetch_array($options)) {
            $result[] = $local;
        }

        $msg->icon = 'success';
        $msg->title = "Load danh sách đáp án thành công!";
        $msg->content = $result;
        $msg->statusCode = 200;
    } else {
        $msg->icon = 'error';
        $msg->title = "Load danh sách đáp án thất bại!";
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}

function getCorrectOption($question_id){
    $sql = "SELECT * FROM options 
    WHERE question_id = '" . $question_id . "'
    AND correct = 1 
    LIMIT 1";


    $result = mysql_query($sql, dbconnect());

    $msg = new Message();
    if ($result && mysql_num_rows($result)>0) {        
        $option = mysql_fetch_array($result);
        $msg->icon = 'success';
        $msg->title = "Lấy đáp án đúng thành công!";
        $msg->content = $option;
        $msg->statusCode = 200;
    } else {
        $msg->icon = 'error';
        $msg->title = "Lấy đáp án đúng thất bại thất bại!";
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}