<?php

/**
 * @author ReDo
 * @copyright 2023
 */
include_once('classes/m_message.php');
include_once('m_db.php');


function LoadProvinces()
{   
    $local_list = mysql_query("SELECT code,full_name,default_pro
    FROM provinces  ORDER BY name", dbconnect());
    $msg = new Message();
    if($local_list){
        $result = array();
        while ($local = mysql_fetch_array($local_list)) {
            $result[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Load danh sách tỉnh thành thành công!";
        $msg->statusCode = 200;
        $msg->content = $result;
    }else{
        $msg->icon = "error";
        $msg->title = "Load danh sách tỉnh thành thất bại!";
        $msg->statusCode = 500;
        $msg->content = mysql_error();
    }
   
    return $msg;
}

function LoadDistrictsByPro($pro_code)
{
    $sql = "SELECT code,full_name FROM districts 
    WHERE province_code='".$pro_code."'
    ORDER BY name
    ";
    $local_list = mysql_query($sql, dbconnect());
    $msg = new Message();
    if($local_list){
        $result = array();
        while ($local = mysql_fetch_array($local_list)) {
            $result[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Load danh sách quận huyện thành công!";
        $msg->statusCode = 200;
        $msg->content = $result;
    }else{
        $msg->icon = "error";
        $msg->title = "Load danh sách quận huyện thất bại!";
        $msg->statusCode = 500;
        $msg->content = mysql_error();
    }
   
    return $msg;
}

function LoadWardsByDist($dist_code)
{
    $sql = "SELECT code,full_name FROM wards WHERE district_code='".$dist_code."'  ORDER BY name";
    $local_list = mysql_query($sql, dbconnect());
    $msg = new Message();
    if($local_list){
        $result = array();
        while ($local = mysql_fetch_array($local_list)) {
            $result[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Load danh sách xã phường thành công!";
        $msg->statusCode = 200;
        $msg->content = $result;
    }else{
        $msg->icon = "error";
        $msg->title = "Load danh sách xã phường thất bại!";
        $msg->statusCode = 500;
        $msg->content = mysql_error();
    }
   
    return $msg;
}

