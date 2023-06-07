<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertdm($local){
    mysql_query("insert dm_news set 
    title = '".$local['title']."',
    hien_thi = '".$local['hien_thi']."',
    menu_trai = '".$local['menu_trai']."',
    linh_vuc = '".$local['linh_vuc']."',
    sap_xep = '".$local['sap_xep']."'",
    dbconnect());
}

function getListdm()
    {
    $local_list = mysql_query("SELECT * FROM dm_news ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getdm($id)
    {
    $pro = mysql_query("select * from dm_news where id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editdm($id, $local)
{
    mysql_query("update dm_news set 
    title ='".$local['title']."',
    hien_thi ='".$local['hien_thi']."',
    menu_trai = '".$local['menu_trai']."',
    linh_vuc = '".$local['linh_vuc']."',
    sap_xep = '".$local['sap_xep']."'
    where id = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function deldmnews($id){
    mysql_query("delete from dm_news where id= '".(int)$id."'", dbconnect());
}

?>