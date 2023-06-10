<?php

/**
 * @author ReDo
 * @copyright 2023
 */

class Option
{

    function get($question_id, $random_options)
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

    function get_options_by_question($question_id)
    {
        $sql = "SELECT id,content,correct FROM options WHERE question_id = " . $question_id;
        $local_list = mysql_query($sql, dbconnect());

        $result = array();
        while ($local = mysql_fetch_array($local_list)) {
            $result[] = $local;
        }
        return $result;
    }
    function create($question_id, $content, $correct, $created_by)
    {
        $result = mysql_query("INSERT INTO options(question_id,content,correct,created_by) 
                    VALUES('" . $question_id . "','" . $content . "'," . $correct . ",'" . $created_by . "')", dbconnect());


        if ($result && mysql_affected_rows() > 0) {
            return true;
        } else {
            return mysql_error();
        }
    }

    function update($id, $content, $correct, $updated_by)
    {
        $result = mysql_query("UPDATE options 
        SET content='" . $content . "',
            correct='" . $correct . "',
            updated_by=" . $updated_by . ",
            updated_at=CURRENT_TIMESTAMP()
            WHERE id =" . $id, dbconnect());


        if ($result &&  mysql_affected_rows() > 0) {
            return true;
        } else {
            return mysql_error();
        }
    }
    function delete($id)
    {
        $result = mysql_query("delete from options where id= " . $id, dbconnect());

        if ($result &&  mysql_affected_rows() > 0) {
            return true;
        } else {
            return mysql_error();
        }
    }

    function deletebyQuestion($question_id)
    {
        $result = mysql_query("delete from options where question_id= " . $question_id, dbconnect());

        if ($result &&  mysql_affected_rows() > 0) {
            return true;
        } else {
            return mysql_error();
        }
    }
}
