<?php

/**
 * @author ReDo
 * @copyright 2023
 */
include_once('m_db.php');
include_once('classes/m_message.php');

function ProvincesWorkplaces($search){
    $sql = "SELECT p.full_name AS province, 
            CONCAT('[', GROUP_CONCAT(CONCAT('{\"id\": ', w.id, ', \"name\": \"', w.name, '\"}')), ']') AS workplaces
            FROM provinces p
            JOIN workplaces w ON p.code = w.province_code
            WHERE w.name like '%" . $search . "%' 
            GROUP BY p.full_name
            LIMIT 10;";

    $result = mysql_query($sql,dbconnect());
    $msg = new Message();
    if($result){
        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Load đơn vị công tác theo tỉnh thành thành công!";
        $msg->content = $arr;
        $msg->statusCode = 200;
    }else{
        $msg->icon = 500;
        $msg->title = "Load đơn vị công tác theo tỉnh thành thất bại";
        $msg->content = mysql_error();
        $msg->icon ="error";
    }
    return $msg;
}
function LoadProvinces()
{   
    $local_list = mysql_query("SELECT code,full_name,default_pro
    FROM provinces", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)) {
        $result[] = $local;
    }
    return $result;
}

function LoadDistrictsByPro($pro_code)
{
    $sql = "SELECT code,full_name FROM districts WHERE province_code=".$pro_code;
    $local_list = mysql_query($sql, dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)) {
        $result[] = $local;
    }
    return $result;
}

function LoadWardsByDist($dist_code)
{
    $sql = "SELECT code,full_name FROM wards WHERE district_code=".$dist_code;
    $local_list = mysql_query($sql, dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)) {
        $result[] = $local;
    }
    return $result;
}

