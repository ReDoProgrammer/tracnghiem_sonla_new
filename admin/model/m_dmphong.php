<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertdmphong($local){
    mysql_query("insert danh_ba_dm set 
    tieu_de = '".$local['tieu_de']."',
    stt = '".$local['stt']."'",
    dbconnect());
}

function getListdm()
    {
    $local_list = mysql_query("SELECT * FROM danh_ba_dm ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getdm($id)
    {
    $pro = mysql_query("select * from danh_ba_dm where id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editdm($id, $local)
{
    mysql_query("update danh_ba_dm set 
    tieu_de ='".$local['tieu_de']."',
    stt = '".$local['stt']."'
    where id = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function deldm($id){
    mysql_query("delete from danh_ba_dm where id= '".(int)$id."'", dbconnect());
}

?>