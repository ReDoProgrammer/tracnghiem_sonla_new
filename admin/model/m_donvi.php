<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertdonvi($local){
    mysql_query("insert dm_donvi set ten_don_vi = '".$local['ten_don_vi']."',
    thu_tu = '".$local['thu_tu']."'",
    dbconnect());
}

function getListdonvi()
    {
    $local_list = mysql_query("SELECT * FROM dm_donvi", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getdonvi($id)
    {
    $pro = mysql_query("select * from dm_donvi where id_donvi = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editdonvi($id, $local)
{
    mysql_query("update dm_donvi set ten_don_vi ='".$local['ten_don_vi']."',
    thu_tu = '".$local['thu_tu']."'
    where id_donvi = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function deldonvi($id){
    mysql_query("delete from dm_donvi where id_donvi= '".(int)$id."'", dbconnect());
}

?>