<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertdm($local){
    mysql_query("insert danh_muc_sp set 
    ten_danh_muc_sp = '".$local['ten_danh_muc_sp']."',
    thu_tu = '".$local['thu_tu']."'",
    dbconnect());
}

function getListdm()
    {
    $local_list = mysql_query("SELECT * FROM danh_muc_sp ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getdm($id)
    {
    $pro = mysql_query("select * from danh_muc_sp where id_danh_muc = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editdm($id, $local)
{
    mysql_query("update danh_muc_sp set ten_danh_muc_sp ='".$local['ten_danh_muc_sp']."',
    thu_tu = '".$local['thu_tu']."'
    where id_danh_muc = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delDanhmuc($id){
    mysql_query("delete from danh_muc_sp where id_danh_muc= '".(int)$id."'", dbconnect());
}

?>