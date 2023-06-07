<?php

/**
 * @author ReDo
 * @copyright 2023
 */

class Option
{

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
