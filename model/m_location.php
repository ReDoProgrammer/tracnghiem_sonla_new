<?php

/**
 * @author ReDo
 * @copyright 2023
 */

function LoadProvinces()
{   
    $local_list = mysql_query("SELECT code,full_name,default_pro
    FROM provinces  ORDER BY name", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)) {
        $result[] = $local;
    }
    return $result;
}

function LoadDistrictsByPro($pro_code)
{
    $sql = "SELECT code,full_name FROM districts 
    WHERE province_code='".$pro_code."'
    ORDER BY name
    ";
    $local_list = mysql_query($sql, dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)) {
        $result[] = $local;
    }
    return $result;
}

function LoadWardsByDist($dist_code)
{
    $sql = "SELECT code,full_name FROM wards WHERE district_code='".$dist_code."'  ORDER BY name";
    $local_list = mysql_query($sql, dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)) {
        $result[] = $local;
    }
    return $result;
}

