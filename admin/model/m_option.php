<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include_once('m_db.php');
include_once('classes/m_message.php');
include_once('classes/m_option.php');
function oGet($question_id, $random_options)
{
    $sql = "SELECT id,content,correct FROM options WHERE question_id = '" . $question_id . "'";
    if ($random_options == 1) {
        $sql .= "  ORDER BY RAND()";
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

function oGetOptionsByQuestion($question_id)
{
    $sql = "SELECT id,content,correct FROM options 
            WHERE question_id = '".$question_id."'
            ORDER BY id
    ";
    $local_list = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($local_list) {
        $result = array();
        while ($local = mysql_fetch_array($local_list)) {
            $result[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Lấy danh sách đáp án của câu hỏi thành công!";
        $msg->statusCode = 200;
        $msg->content = $result;
    }else{
        $msg->title = "Load danh sách đáp án của câu hỏi thất bại";
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->content = mysql_error();
    }
    return $msg;
}

function oUpdateMany($question_id,$options,$user){
    $sql = "DELETE FROM options WHERE question_id = '".$question_id."'
            AND id IN(";
    foreach($options as $opt){
        $sql.="'".$opt['id']."'";
        $sql.=$opt == end($options)?")":",";
    }
    $result = mysql_query($sql,dbconnect());
    $msg = new Message();
    if($result && mysql_affected_rows()>0){
        $sql = "INSERT INTO options(question_id,content,correct,created_by) VALUES";
        foreach($options as $opt){
            $sql.="('".$question_id."','".$opt['option']."','".$opt['check']."','".$user."')";
            $sql.=$opt == end($options)?"":",";
        }
        $result = mysql_query($sql,dbconnect());
        if($result && mysql_affected_rows()>0){
            $msg->icon = "success";
            $msg->statusCode = 201;
            $msg->title = "Insert các đáp án của câu hỏi thành công!";
        }else{
            $msg->statusCode = 500;
            $msg->title = "Insert các đáp án của câu hỏi thất bại!";
            $msg->icon = "error";
            $msg->content = mysql_error();
        }
    }else{
        $msg->title = "Xóa các đáp án cũ thất bại!";
        $msg->icon = "error";
        $msg->statusCode = 500;
        $msg->content = mysql_error();
    }
    return $msg;
}
function oInsertMany($question_id,$options,$created_by){
    $sql ="INSERT INTO options(question_id,content,correct,created_by) VALUES";
    foreach($options as $opt){
        $sql .="('".$question_id."','".$opt->content."','".$opt->check."','".$created_by."')";
        $sql .= $opt==end($options)?"":",";
    }
    $result = mysql_query($sql,dbconnect());
    $msg = new Message();
    if($result &&  mysql_affected_rows()>0){
        $msg->statusCode = 201;
        $msg->title = "Insert nhiều đáp án thành công!";
        $msg->icon = "success";
    }else{
        $msg->title = "Insert nhiều đáp án thất bại!";
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->content = mysql_error();
    }
    return $msg;
}
function oCreate($question_id, $content, $correct, $created_by)
{
    $result = mysql_query("INSERT INTO options(question_id,content,correct,created_by) 
                    VALUES('" . $question_id . "','" . $content . "'," . $correct . ",'" . $created_by . "')", dbconnect());


    if ($result && mysql_affected_rows() > 0) {
        return true;
    } else {
        return mysql_error();
    }
}

function oUpdate($id, $content, $correct, $updated_by)
{
    $result = mysql_query("UPDATE options 
        SET content='" . $content . "',
            correct='" . $correct . "',
            updated_by=" . $updated_by . ",
            updated_at=CURRENT_TIMESTAMP()
            WHERE id =" . $id, dbconnect());


    if ($result && mysql_affected_rows() > 0) {
        return true;
    } else {
        return mysql_error();
    }
}
function oDelete($id)
{
    $result = mysql_query("delete from options where id= " . $id, dbconnect());

    if ($result && mysql_affected_rows() > 0) {
        return true;
    } else {
        return mysql_error();
    }
}

function oDeletebyQuestion($question_id)
{
    $result = mysql_query("delete from options where question_id= " . $question_id, dbconnect());

    if ($result && mysql_affected_rows() > 0) {
        return true;
    } else {
        return mysql_error();
    }
}

