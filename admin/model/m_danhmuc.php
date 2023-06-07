<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertDanhmuc($local){
    mysql_query("insert danh_muc set 
	ten_danh_muc = '".$local['ten_danh_muc']."',
	trang_thai = '".$local['trang_thai']."',
    sap_xep = '".$local['sap_xep']."'",
    dbconnect());
}

function getListDanhmuc()
    {
    $local_list = mysql_query("SELECT * FROM danh_muc", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getDanhmuc($id)
    {
    $pro = mysql_query("select * from danh_muc where ma_danh_muc = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editDanhmuc($id, $local)
{
    mysql_query("update danh_muc set 
	ten_danh_muc ='".$local['ten_danh_muc']."',
	trang_thai = '".$local['trang_thai']."',
    sap_xep = '".$local['sap_xep']."'
    where ma_danh_muc = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delDanhmuc($id){
    mysql_query("delete from danh_muc where ma_danh_muc= '".(int)$id."'", dbconnect());
}


function update_vitri($id,$vt){
    mysql_query("update danh_muc set 
    sap_xep = '".$vt."'
    where ma_danh_muc = '".(int)$id."'",
    dbconnect());
}

?>