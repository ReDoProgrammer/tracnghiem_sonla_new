<?php

/**
 * @author honestphan
 * @copyright 2011
 */
 
// no direct access
defined('DSVH') or die('Restricted access');

function insert_online($time,$ip,$sid,$user,$ref){
    $sql="insert into online(time,ip,sid,user,ref) values('".$time."','".$ip."','".$sid."','".$user."','".$ref."')";
    $query=@mysql_query($sql,dbconnect());
}

function del_exp_online($old_time){
    $sql="delete from online where time < '".$old_time."'";
	$query=@mysql_query($sql,dbconnect());
}

function view_this_page($ref){
    $sql="SELECT distinct sid FROM online WHERE ref='".$ref."'";
	$query=@mysql_query($sql,dbconnect());
    $user_view_this_page = @mysql_num_rows($query);
    return $user_view_this_page;
}

function user_online_by_ip(){
    $sql="SELECT distinct ip FROM online";
	$query=@mysql_query($sql,dbconnect());
	$user_online = @mysql_num_rows($query);
    return $user_online;
}

function listAdmin(){
    $list = mysql_query("select distinct sid, user FROM online WHERE user <> 'guest' " , dbconnect());
    $result = array();
    while($config = mysql_fetch_array($list)){
       $result[] = $config;
    }
     return $result;
}

function user_online_by_sid(){
    $sql="SELECT distinct sid FROM online";
	$query=@mysql_query($sql,dbconnect());
	$user_online = @mysql_num_rows($query);
    return $user_online;
}

function total_user_view(){
    $sql = "select * from statics";
	$result=mysql_query($sql,dbconnect());
	$rows=mysql_fetch_array($result);
    return $counter = $rows['total_user_view'];
}

function total_page_view(){
    $sql = "select * from statics";
	$result=mysql_query($sql,dbconnect());
	$rows=mysql_fetch_array($result);
    return $counter = $rows['total_pages_view'];
}

function insert_statics($ttuv,$ttpv){
    $sql="INSERT INTO statics(total_user_view,total_pages_view) VALUES('".$ttuv."','".$ttpv."')";
	$result=mysql_query($sql,dbconnect());
}

function update_statics($ttuv,$ttpv){
    $sql="update statics set total_user_view = '".$ttuv."', total_pages_view ='".$ttpv."'";
	$result=mysql_query($sql,dbconnect()); 
}

function check_sid($sid){
    $sql="SELECT distinct sid FROM online WHERE sid ='".$sid."' limit 1";
	$query=mysql_query($sql,dbconnect());
    $row = mysql_num_rows($query);
    return $row;
}


?>