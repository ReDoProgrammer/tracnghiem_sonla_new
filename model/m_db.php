<?php

/**
 * @author honestphan
 * @copyright 2011
 */
 // no direct access

// defined('DSVH') or die('Restricted access');

function dbconnect (){
    static $connect= null;
    if($connect == null){
        $connect = mysql_connect('localhost','root','123456') or die('SVTB NOTE: Could not connect to database!');
        mysql_select_db('tracnghiem')  or die('SVTB NOT: Database not exist!');
        mysql_query("SET NAMES 'utf8'", $connect);
		mysql_query("SET CHARACTER SET utf8", $connect);
		mysql_query("SET CHARACTER_SET_CONNECTION=utf8", $connect);
		mysql_query("SET SQL_MODE = ''", $connect);
    }
     return $connect;
}

function escape($value){
    return mysql_real_escape_string($value);
}

function filter($keywords){
   $keywords = str_replace("_","\_",$keywords);
   $keywords = str_replace("%","\%",$keywords);
   return $keywords;
}

function checkrangbuocdulieu($table,$column,$param){
    $sql = "SELECT * FROM '".$table."' where  '".$column."' = '".escape($param)."'";
    $result = mysql_query($sql, dbconnect());
    return mysql_num_rows($result);
}

function write_logs($action, $this_time){
    mysql_query("insert nhat_ky set 
    user_id = '".$_SESSION['can_bo_id']."',
    user_name = '".$_SESSION['user']."',
    user_action = '".$action."',
    action_time = '".$this_time."'", 
    dbconnect());
}

function fs($id)

    {

        $id = str_replace("+","",$id);

        $id = str_replace("'","''",$id);

        $id = str_replace("UNI0N","",$id);

        $id = str_replace("select","",$id);

        $id = str_replace("*","",$id);

        $id = str_replace("%","",$id);

        $id = str_replace("%","",$id);

        $id = str_replace("2b","",$id);

        if (strlen($id) > 10)

        {

            $id="";

        }

    return $id;

    }

?>